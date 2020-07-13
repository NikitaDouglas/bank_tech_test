require "account"

describe "Account" do
  it "should be able to be initialised" do
    a = Account.new 
    expect(a).to be_instance_of(Account)
  end
end