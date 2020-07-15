class Transaction

attr_accessor :date, :credit

  def initialize(date = Time.now, credit = :-)  
    @date = date
    @credit = credit
  end
end