1.
#at the bottom of our code the use of the .transfer_funds_to method spells it all out. account1.transfer_funds_to(account2, 30)
#account1 is the BankAccount instance that we are starting out with/using inside the entire BankAccount class until we reach the instance method on line 24
#where the transfer_funds_to method  calls on the second account in the arguments. 


2.

class BankAccount

  def initialize(type_of_account, starting_balance)
    @balance = starting_balance
    @account = type_of_account
  end

  def account
    return @account
  end

  def balance
    return @balance
  end

  def deposit(money)
    @balance = @balance + money
  end

  def withdraw(money)
    if @account == "CD"
      @balance = @balance - money * 1.10
    elsif
      @balance - money >= 0
      @balance = @balance - money
      return @balance
    else
      return 0
    end

  end

  def transfer_funds_to(bank_account, money)
    available_funds = withdraw(money)
    bank_account.deposit(money)
  end

end

account1 = BankAccount.new("CD", 100)
  
puts account1.withdraw(10) #=> 89


