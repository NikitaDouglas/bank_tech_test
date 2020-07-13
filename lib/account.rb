class Account

  attr_accessor :balance
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    return insufficient_funds_message if insufficient_funds?(amount)
    @balance -= amount
  end

  private

  def insufficient_funds?(amount)
    @balance - amount < DEFAULT_BALANCE
  end

  def insufficient_funds_message
    "You don't have enough money in your account to withdraw that much."
  end
end
