class Formatter

  def format(transaction_history)
    statement = ["Date || Credit || Debit || Balance"]
    transaction_history.each do |transaction|
      statement.push("#{format_date(transaction.date)} || #{format_integer(transaction.credit)} || #{format_integer(transaction.debit)} || #{format_integer(transaction.balance)}")
    end
    statement
  end

  private

  def format_integer(amount)
    "%.2f" % amount
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end
end
