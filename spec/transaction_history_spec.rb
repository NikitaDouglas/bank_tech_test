require "transaction_history"
require 'timecop'

describe "TransactionHistory" do

  subject(:transaction_history) { TransactionHistory.new }
  let(:test_time) { Timecop.freeze(Time.local(2020, 7, 13)) }
  let(:add_transaction) { transaction_history.add_transaction(test_time, 1000) } 

  it "instantiates with an empty array" do
    expect(transaction_history.history).to eq []
  end

  describe "#add_transaction" do
    it "adds date and amount of deposit to transaction_history of account" do
      expect{ add_transaction }.to change{ transaction_history.history }.to([{:date => test_time, :amount => 1000}])
    end
  end
end