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
      account.deposit(2000)
      [10, 100, 1000].each do |amount|
        expect { account.withdraw(amount) }.to change { account.balance }.by(-amount)
      end
    end

    it "should return an apt message when a withdrawal exceeds the user's balance" do
      message = "You don't have enough money in your account to withdraw that much."
      expect(account.withdraw(10)).to eq message
    end
  end
end
