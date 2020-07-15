class Transaction

attr_accessor :date, :credit

  def initialize(credit, date = Time.now)  
    @date = date
    @credit = credit
  end
end