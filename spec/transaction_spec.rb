require "transaction"

describe "Transaction" do

  let(:test_time) { Timecop.freeze(Time.local(2020, 7, 13)) }
  subject(:transaction) { Transaction.new(1000) }

  it "should instatiate with a date equal to Time.now by default" do
    expect(transaction.date).to eq test_time
  end

  it "can instatiate with a credit with an integer as a value" do
    expect(transaction.credit).to eq 1000
  end
end