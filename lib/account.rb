require_relative "./transaction_history"

class Account

  attr_accessor :balance, :transaction_history
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE, transaction_history = TransactionHistory.new)
    @balance = balance
    @transaction_history = transaction_history
  end

  def deposit(amount)
    @balance += amount
    @transaction_history.add_transaction(Time.now, amount)
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
