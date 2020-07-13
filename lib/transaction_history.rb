class TransactionHistory

  attr_accessor :history

  def initialize
    @history = []
  end

  def add_transaction(date, amount, balance)
    @history.push({ :date => date, :amount => amount, :balance => balance })
  end
end
