class Account

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    return "You don't have enough money in your account to withdraw that much." if (@balance - amount < 0)
    @balance -= amount
  end
end
