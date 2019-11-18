require 'spec_helper'
require 'cryptocompare'
require 'date'
require_relative '../../lib/models/transaction.rb'

RSpec.describe Transaction do
  before do
    @transaction = Transaction.new(
      {
       'timestamp' => '1571967208', 'transaction_type' => 'DEPOSIT111',
       'token' => 'BTC', 'amount' => 0.29866
      }
    )
  end

  describe '#token?' do
    it 'result should return boolean' do
      expect(@transaction.token?('BTC')).to be_a_kind_of(TrueClass)
    end
  end

  describe '#amount_in_usd' do
    it 'result should return float' do
      expect(@transaction.amount_in_usd).to be_a_kind_of(Float)
    end
  end

  describe '#date' do
    it 'result should be equal to 2019-10-25' do
      expect(@transaction.date).to eq('2019-10-25')
    end
  end
end
