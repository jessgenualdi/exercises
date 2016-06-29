class BankAccount

  # 1.
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
    # 2.
    if @account == "CD"
      if @balance - money  * 1.10 >= 0
        @balance = @balance - money * 1.10
        return @balance
      else
        return 0
      end
    elsif
      @balance - money >= 0
      @balance = @balance - money
      return money
    else
      return 0
    end

  end

  def transfer_funds_to(bank_account, money)
    if @account == "CD"
      return 0
    # elsif bank_account.account == "CD"
    #   return 0
    else
      available_funds =withdraw(money)
      bank_account.deposit(available_funds)
    end
  end

end

account1 = BankAccount.new("Checking", 100)
account2 = BankAccount.new("savings", 300)
account3 = BankAccount.new("CD", 650)
  
# puts account1.withdraw(10) #=> 89
account1.transfer_funds_to(account2, 100) 
puts account1.balance # => 75
puts account2.balance # => 375
