require "transaction_history"

describe "TransactionHistory" do

  subject(:transaction_history) { TransactionHistory.new }

  it "instantiates with an empty array" do
    expect(transaction_history.history).to eq []
  end
end