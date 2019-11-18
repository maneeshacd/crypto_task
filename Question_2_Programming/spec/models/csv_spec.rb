require 'spec_helper'
require_relative '../../lib/models/csv.rb'
require_relative '../../constants.rb'

RSpec.describe Csv do
  let(:source_csv) { double }

  before do

    allow(source_csv)
      .to receive(:foreach)
      .and_yield({
       'timestamp' => 1571967208, 'transaction_type' => 'DEPOSIT111',
       'token' => 'BTC', 'amount' => 0.29866
      }).and_yield({
       'timestamp' => 1571967200, 'transaction_type' => 'DEPOSIT',
       'token' => 'ETH', 'amount' => 0.68364
      }).and_yield({
       'timestamp' => 1571967150, 'transaction_type' => 'WITHDRAWAL',
       'token' => 'XRP', 'amount' => 0.693272
      })
    @csv = Csv.new
  end

  describe '#latest_portfolio_value_per_token' do
    before do
      @csv.latest_portfolio_value_per_token
    end

    it 'result should be a hash' do
      expect(@csv.result).to be_a_kind_of(Hash)
    end

    it 'should contains the elements in constant tokens' do
      expect(@csv.result.keys).to eq(TOKENS)
    end
  end

  describe '#latest_portfolio_value_of(token)' do
    before do
      @csv.latest_portfolio_value_of('BTC')
    end

    it 'result should be a hash' do
      expect(@csv.result).to be_a_kind_of(Hash)
    end

    it 'should contains only one hash' do
      expect(@csv.result.keys.count).to eq(1)
    end

    it 'should contain the specified token' do
      expect(@csv.result.keys).to eq(['BTC'])
    end
  end

  describe '#latest_portfolio_value_per_token_in_given_date(date)' do
    before do
      @csv.latest_portfolio_value_per_token_in_given_date('2019-10-25')
    end

    it 'result should be a hash' do
      expect(@csv.result).to be_a_kind_of(Hash)
    end

    it 'should contains 3 hash keys' do
      expect(@csv.result.keys.count).to eq(3)
    end

    it 'should contains the elements in constant tokens' do
      expect(@csv.result.keys).to eq(TOKENS)
    end
  end

  describe '#portfolio_value_of_given_date_and_token(date, token)' do
    before do
      @csv.portfolio_value_of_given_date_and_token('2019-10-25', 'BTC')
    end

    it 'result should be a hash' do
      expect(@csv.result).to be_a_kind_of(Hash)
    end

    it 'should contains 1 hash key' do
      expect(@csv.result.keys.count).to eq(1)
    end

    it 'should contains the elements in constant tokens' do
      expect(@csv.result.keys).to eq(['BTC'])
    end
  end
end
