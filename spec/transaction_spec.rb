require "transaction"
require "timecop"

describe "Transaction" do

  let(:test_time) { Time.local(2020, 7, 13) }
  subject(:transaction) { Transaction.new(1000, 0, 0) }

  before do
    Timecop.freeze(test_time)
  end

  it "should instatiate with a date equal to Time.now by default" do
    expect(transaction.date).to eq test_time
  end

  it "can instatiate with a credit with an integer as a value" do
    expect(transaction.credit).to eq 1000
  end

  it "can instatiate with a debit with an integer as a value" do
    expect(transaction.debit).to eq 0
  end

  it "can instantiate with a balance with an integer as a value" do
    expect(transaction.balance).to eq 0
  end
end