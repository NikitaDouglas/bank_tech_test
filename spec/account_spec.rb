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
end
