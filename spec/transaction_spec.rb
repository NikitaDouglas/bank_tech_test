require "transaction"

describe "Transaction" do

  let(:test_time) { Timecop.freeze(Time.local(2020, 7, 13)) }
  subject(:transaction) { Transaction.new(test_time) }

  it "should instantiate with a date" do
    expect(transaction.date).to eq test_time
  end

  it "should instatiate with a date equal to Time.now by default" do
    new_transaction = Transaction.new
    expect(new_transaction.date).to eq test_time
  end
end