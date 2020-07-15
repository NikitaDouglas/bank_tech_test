require "transaction"

describe "Transaction" do

  let(:test_time) { Timecop.freeze(Time.local(2020, 7, 13)) }
  subject(:transaction) { Transaction.new(test_time) }

  it "should instatiate with a date equal to Time.now by default" do
    expect(transaction.date).to eq test_time
  end

  it "can instantiate with a credit with a default value of ':-'" do
    expect(transaction.credit).to eq :-
  end
end