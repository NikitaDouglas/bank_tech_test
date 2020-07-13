require "transaction"

describe "Transaction" do

  subject(:transaction) { Transaction.new }

  it "instantiates with an empty array" do
    expect(transaction.history).to eq []
  end
end