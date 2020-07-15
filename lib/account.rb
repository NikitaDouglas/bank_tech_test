require_relative 'transaction'
require_relative 'formatter'

class Account

  attr_accessor :balance, :transaction_history
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE, formatter = Formatter.new)
    @balance = balance
    @transaction_history = []
    @formatter = formatter
  end

  def deposit(amount)
    @balance += amount
    add_debit_transaction(amount)
  end

  def withdraw(amount)
    return insufficient_funds_message if insufficient_funds?(amount)
    
    @balance -= amount
    add_credit_transaction(amount)
  end

  def see_statement
    puts @formatter.format(@transaction_history)
  end

  private

  def insufficient_funds?(amount)
    @balance - amount < DEFAULT_BALANCE
  end

  def insufficient_funds_message
    "You don't have enough money in your account to withdraw that much."
  end

  def add_debit_transaction(amount)
    @transaction_history << Transaction.new(0, amount, @balance)
  end

  def add_credit_transaction(amount)
    @transaction_history << Transaction.new(amount, 0, @balance)
  end
end
