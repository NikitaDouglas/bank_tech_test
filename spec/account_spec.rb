require "account"

describe "Account" do

  subject(:account) { Account.new }

  it "should be able to be initialised" do
    account = Account.new 
    expect(account).to be_instance_of(Account)
  end

  it "should instantiate with a balance of zero" do
    expect(account.balance).to eq Account::DEFAULT_BALANCE
  end

  it "should instatiates with a transaction history" do
    expect(account.transaction_history).to eq []
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

  describe "interface with Transaction class" do
    it "adds a new transaction to history array when a deposit is made" do
      expect { account.deposit(10) }.to change { account.transaction_history.length }.by 1
    end

    it "adds a new transaction to history array when a withdrawal is made" do
      account.deposit(1000)
      expect { account.withdraw(10) }.to change { account.transaction_history.length }.by 1
    end
  end
end
