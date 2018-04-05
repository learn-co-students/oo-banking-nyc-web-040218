class BankAccount
  attr_accessor :status, :balance
  attr_reader :name

    def initialize(name)
      @name = name
      @balance = 1000
      @status = "open"
    end

    def deposit(deposit)
      self.balance += deposit
    end

    def display_balance
      "Your balance is $#{self.balance}."
    end

    def valid?
      (self.balance > 0 && @status == 'open') ? true : false
    end

    def close_account
      # if self.valid? == false
        self.status = 'closed'
      # else
      # self.status = 'open'
      # end
      # binding
    end


 end