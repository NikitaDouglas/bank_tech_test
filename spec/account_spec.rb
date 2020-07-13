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
end




  #  it 'allows the shopper to see the price formatted as £XX.XX' do
  #     [0.4, 5.6, 3.0].each do |price|
  #       allow(item_double).to receive(:check_price) { price }
  #       checkout.scan(item_double)
  #     end
  #     expect(checkout.see_total).to eq("£9.00")
