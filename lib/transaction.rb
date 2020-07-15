class Transaction

  attr_accessor :date, :credit, :debit, :balance

  def initialize(credit, debit, balance, date = Time.now)  
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end
end
