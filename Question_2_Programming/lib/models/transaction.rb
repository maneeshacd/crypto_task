class Transaction

  def initialize(data)
    @timestamp = data['timestamp']
    @transaction_type = data['transaction_type']
    @token = data['token']
    @amount = data['amount']
  end

  def token?(token)
    @token == token
  end

  def amount_in_usd
    @amount.to_f *
      Cryptocompare::Price.find(@token.to_s, 'USD')[@token.to_s]['USD']
  end

  def date
    DateTime.strptime(@timestamp, '%s').strftime('%Y-%m-%d')
  end
end
