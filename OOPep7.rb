puts
puts " -------------"
puts "| OOP ep07.rb |"
puts " -------------"
puts
​
# OOP Ep07.rb Synthesis: Putting it All Together
#####################################
# Karen: Notes/Practice from video
# Using two class instances
​
class BankAccount
​
  def initialize (account, starting_balance)
    @account = account
    @balance = starting_balance
  end
​
# Karen: I added an account name instance method because I wanted to be able to produce
# customized string based on the account name. (i.e., "$ was transferred to account 2")
  def account_name= (account_name)
    @account = account_name
  end
​
  def account_name
    return @account
  end
​
  def balance= (amount)
    @balance = amount
  end
​
  def balance
    return @balance
  end
​
  def deposit(money)
    @balance = @balance + money
  end
​
  def withdraw(money)
    if @balance - money >= 0
      @balance = @balance - money
      return money
    else
      puts "Not enough funds to withdraw $" + money.to_s 
      return 0
    end 
  end
​
  def transfer_funds_to(bank_account, amount)
    available_funds = withdraw(amount)
    bank_account.deposit(available_funds)
    puts "$" + available_funds.to_s + " was withdrawn from " + account_name + " and transferred to " + bank_account.account_name + "."
    puts account_name + " balance is now $" + balance.to_s + "."
    puts bank_account.account_name + " balance is now $" + bank_account.balance.to_s + "."
  end
​
end
​
account1 = BankAccount.new("account 1", 100)
account2 = BankAccount.new("account 2", 0)
​
account1.transfer_funds_to(account2, 30)
​
puts
puts
​
​
#####################################
# The ‘transfer_funds_to’ method is essentially dealing with two different bank accounts
# (a.k.a. two bank account instances). 
# How does it know which bank account to withdraw money from and which bank account to deposit money to?
​
​
# Karen: whichever instance of the bank account is written before the ".transfer_funds_to" is the instance
# that is calling the instance methods. That means that the subsequent 'withdraw' instance method will
# evaluate the commands based on that instance- so it deals with the @balance of the account1 instance
# and then under the transfer_funds_to method, it will withdraw(amount) for the account1 instance. Then 
# whichever bank account the input in the first argument of the parameter refers to, will be the 
# bank account to which the amount is transferred, because it says 'bank_account(i.e. account2).deposit'
​
​
#####################################
# Recreate the BankAccount in your own text editor.
#----------------------------------------------------------
# Add an attribute that indicates whether the account is a checking account, a savings account, or a CD.
# Karen: Reflected in:
  # def type= (account_type)
  #   @type = account_type
  # end
​
  # def type
  #   return @type
  # end
#----------------------------------------------------------
# Update the withdraw method so that if one withdraws money from a CD, 
# they also lose an additional 10% of the money they’re withdrawing due to penalties. 
# For example, if one is withdrawing 10 dollars, they also get hit with a 1 dollar penalty. 
# So if they were withdrawing 10 dollars from a CD that contained 100 dollars, they’d be left with 89 dollars.
# Karen: Reflected in:
  # def withdraw(money)
  #    if type.upcase == "CD"
  #     if @balance - (money + (money * 0.10)) >= 0
  #       @balance = @balance - (money + (money *0.10))
  #       puts "confirmation: $" + money.to_s + " withdrawn." 
  #       puts "a 10\% fee of $" + (money *0.10).to_s + " was deducted from " + account_name + "."
  #       return money
  #      end
  #     .
  #    . 
  #   end 
  # end
​
#----------------------------------------------------------
# Update the transfer_funds_to method to ensure that one cannot transfer funds from a CD or to a CD.
# Karen: reflected in:
#   def transfer_funds_to(bank_account, amount)
  #   if type.upcase == "CD"
  #     puts
  #     puts "Sorry, funds may not be transferred to or from CD accounts."
  #   elsif bank_account.type.upcase == "CD"
  #     puts
  #     puts "Sorry, funds may not be transferred to or from CD accounts."
  #   .
  #   end
  # .
  # end
​
​
puts
puts "Exercise Bank account"
puts
​
class BankAccount
​
  def initialize (account, type, starting_balance)
    @account = account
    @type = type
    @balance = starting_balance
  end
​
  def type= (account_type)
    @type = account_type
    #checking, savings, or CD
  end
​
  def type
    if @type.upcase == "CD"
      return @type.upcase
    else
      return @type.downcase
    end
  end
​
# Karen: I added an account name instance method because I wanted to be able to produce
# customized return strings based on the account name. (i.e., "$ was transferred to account 2")
  def account_name= (account_name)
    @account = account_name
  end
​
  def account_name
    return @account
  end
​
  def balance= (amount)
    @balance = amount
  end
​
  def balance
    return @balance
  end
​
  def deposit(money)
    @balance = @balance + money
  end
​
  def withdraw(money)
    if type.upcase == "CD"
      if @balance - (money + (money * 0.10)) >= 0
        @balance = @balance - (money + (money *0.10))
        puts
        puts "confirmation: $" + money.to_s + " withdrawn." 
        puts "a 10\% fee of $" + (money *0.10).to_s + " was deducted from " + account_name + "."
        return money + (money *0.10)
      end
​
    elsif @balance - money >= 0
      @balance = @balance - money
      puts
      puts "confirmation: $" + money.to_s + " withdrawn." 
      return money
    else
      puts
      puts "Not enough funds to withdraw $" + money.to_s 
      return 0
    end 
  end
​
  def transfer_funds_to(bank_account, amount)
    if type.upcase == "CD"
      puts
      puts "Sorry, funds may not be transferred to or from CD accounts."
    elsif bank_account.type.upcase == "CD"
      puts
      puts "Sorry, funds may not be transferred to or from CD accounts."
    elsif
      available_funds = withdraw(amount)
      bank_account.deposit(available_funds)
      puts "$" + available_funds.to_s + " was transferred from " + account_name + " to " + bank_account.account_name + "."
      puts account_name + " balance is now $" + balance.to_s + "."
      puts bank_account.account_name + " balance is now $" + bank_account.balance.to_s + "."
    end
  end
​
  def info
    puts
    return account_name + " is a " + type + " account with a balance of $" + balance.to_s + "."
  end
​
end
​
account1 = BankAccount.new("account 1", "cd", 100)
account2 = BankAccount.new("account 2", "checking", 50)
account3 = BankAccount.new("account 3", "savings", 60)
​
​
account1.withdraw(40)
# returns: confirmation: $40 withdrawn.
#          a 10% fee of $4.0 was deducted from account 1.
#          => 40
​
account1.transfer_funds_to(account2, 30)
# returns: Sorry, funds may not be transferred to or from CD accounts.
#          => nil
​
account2.transfer_funds_to(account3, 20)
# returns: confirmation: $20 withdrawn.
#          $20 was transferred from account 2 to account 3.
#          account 2 balance is now $30.
#          account 3 balance is now $80.
#          => nil
​
puts
puts
​
​
puts
puts " -------"
puts "| Karen |"
puts " -------"
puts