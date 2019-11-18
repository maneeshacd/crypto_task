class Csv
  attr_reader :result

  def initialize
    @btc_record_found = false
    @eth_record_found = false
    @xrp_record_found = false
    @result = {}
    @transaction = nil
  end

  def latest_portfolio_value_per_token
    CSV.foreach(CSV_URL, headers: true) do |row|
      @transaction = Transaction.new(row)
      first_record_with_token('BTC') if @transaction.token?('BTC')
      first_record_with_token('ETH') if @transaction.token?('ETH')
      first_record_with_token('XRP') if @transaction.token?('XRP')
      break if records_with_each_token_found?
    end
  end

  def latest_portfolio_value_of(token)
    CSV.foreach(CSV_URL, headers: true) do |row|
      @transaction = Transaction.new(row)
      first_record_with_token(token) if @transaction.token?(token)
      break if record_found?(token)
    end
  end

  def latest_portfolio_value_per_token_in_given_date(date)
    CSV.foreach(CSV_URL, headers: true)
       .with_index do |row, i|
      @transaction = Transaction.new(row)

      if given_date_greater_than_last_transaction?(i, date)
        puts 'Given date is greater than last transaction date'
        break
      end
      next unless @transaction.date == date

      first_record_with_token('BTC') if @transaction.token?('BTC')
      first_record_with_token('ETH') if @transaction.token?('ETH')
      first_record_with_token('XRP') if @transaction.token?('XRP')
      break if records_with_each_token_found?
    end
  end

  def portfolio_value_of_given_date_and_token(date, token)
    CSV.foreach(CSV_URL, headers: true) do |row|
      @transaction = Transaction.new(row)
      next unless @transaction.date == date

      first_record_with_token(token) if @transaction.token?(token)
      break if record_found?(token)
    end
  end

  def output(type, date = nil)
    case type
    when 'latest_value_per_token'
      @result.each do |token, value|
        puts "Latest Portfolio value of token #{token} in USD #{value}"
      end
    when 'latest_value_of_given_token'
      @result.each do |token, value|
        puts "Latest Portfolio value of token #{token} in USD #{value}"
      end
    when 'latest_value_per_token_at_given_date'
      @result.each do |token, value|
        puts "Portfolio value of token #{token} in  #{date} in USD #{value}"
      end
    when 'latest_value_of_given_date_and_token'
      @result.each do |token, value|
        puts "Portfolio value of token #{token} in  #{date} in USD #{value}"
      end
    end
  end

  private

  def first_record_with_token(token)
    return if record_found?(token)

    record_found(token)
    @result[token] = @transaction.amount_in_usd
  end

  def records_with_each_token_found?
    @btc_record_found && @eth_record_found && @xrp_record_found
  end

  def record_found(token)
    instance_variable_set("@#{token.downcase}_record_found", true)
  end

  def record_found?(token)
    instance_variable_get("@#{token.downcase}_record_found")
  end

  def given_date_greater_than_last_transaction?(index, date)
    index.zero? && date > @transaction.date
  end
end
