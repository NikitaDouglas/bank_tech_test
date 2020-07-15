class Transaction

attr_accessor :date, :credit, :debit

  def initialize(credit, debit, date = Time.now)  
    @date = date
    @credit = credit
    @debit = debit
  end
end