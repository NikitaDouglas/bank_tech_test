class Formatter

  def format(transaction_history)
    statement = ["Date || Credit || Debit || Balance"]
    transaction_history.each do |transaction|
      statement.push("#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}")
    end
    statement
  end
end