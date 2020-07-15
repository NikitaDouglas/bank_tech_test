require 'formatter'
require 'timecop'

describe "Formatter" do

  subject(:formatter) { Formatter.new }
  let(:test_time) { Time.local(2020, 7, 13) } 

  before do
    Timecop.freeze(test_time)
  end

  it "formats the transaction history into a statement" do

    transaction_double = double(:transaction)
    
    allow(transaction_double).to receive(:date) { test_time }
    allow(transaction_double).to receive(:credit) { 0 }
    allow(transaction_double).to receive(:debit) { 1000 }
    allow(transaction_double).to receive(:balance) { 1000 }
    
    transaction_history = [transaction_double]

    expect(formatter.format(transaction_history))
    .to eq ["Date || Credit || Debit || Balance", "#{test_time} || 0.00 || 1000.00 || 1000.00"]
  end 
end
