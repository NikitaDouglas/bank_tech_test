class Account

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += 10
  end

end
