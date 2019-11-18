require_relative 'lib/models/csv.rb'
require_relative 'lib/models/transaction.rb'
require_relative 'helpers/date_helper.rb'
require_relative 'constants.rb'
require 'csv'
require 'cryptocompare'

@csv = Csv.new
if ARGV.empty?
  @csv.latest_portfolio_value_per_token
  @csv.output('latest_value_per_token')

elsif ARGV.length == 1 && TOKENS.include?(ARGV[0])
  @csv.latest_portfolio_value_of(ARGV[0])
  @csv.output('latest_value_of_given_token')

elsif ARGV.length == 1 && DateHepler.valid_date?(ARGV[0])
  @csv.latest_portfolio_value_per_token_in_given_date(ARGV[0])
  @csv.output('latest_value_per_token_at_given_date', ARGV[0])

elsif ARGV.length == 2 && DateHepler.valid_date?(ARGV[0]) &&
      TOKENS.include?(ARGV[1])
  @csv.portfolio_value_of_given_date_and_token(ARGV[0], ARGV[1])
  @csv.output('latest_value_of_given_date_and_token', ARGV[0])

else
  puts 'Provide valid arguments'
end


