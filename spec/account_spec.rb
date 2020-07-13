require "account"

describe "Account" do

  subject(:account) { Account.new }

  it "should be able to be initialised" do
    account = Account.new 
    expect(account).to be_instance_of(Account)
  end

  it "should instantiate with a balance of zero" do
    expect(account.balance).to eq 0
  end

  describe "#deposit" do
    it "should increase the balance by a specified amount" do
      [10, 100, 1000].each do |amount|
        expect { account.deposit(amount) }.to change { account.balance }.by amount
      end
    end
  end

  describe "#withdraw" do
    it "should decrease the balance by a specified amount" do
      account.deposit(1000)
      [10, 100, 1000].each do |amount|
        expect { account.withdraw(amount) }.to change { account.balance }.by -amount
      end
    end
  end
end
