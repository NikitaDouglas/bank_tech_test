class TransactionHistory

  attr_accessor :history

  def initialize
    @history = []
  end

  def add_transaction(date, amount, balance)
    if amount > 0
      @history.push({ :date => date, :credit => :-, :debit => amount, :balance => balance })
    else 
      absolute_value = amount.abs
      @history.push({ :date => date, :credit => absolute_value, :debit => :-, :balance => balance })
    end
  end
end
