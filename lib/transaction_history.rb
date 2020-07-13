class TransactionHistory

  attr_accessor :history

  def initialize
    @history = []
  end

  def add_transaction(date, amount)
    @history.push({:date => date, :amount => amount})
  end

end