require "pry"
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status, :counter

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @counter = 0
  end

  def valid?
    @sender.valid? && @sender.balance >= amount && @receiver.valid?
  end

  def execute_transaction
    if valid? && @counter == 0
      # binding.pry
      @sender.balance -= amount
      @receiver.balance += amount
      # binding.pry
      @status = "complete"
      @counter = 1
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if counter == 1
      @sender.balance += amount
      @receiver.balance -= amount
      # binding.pry
      @status = "reversed"
    end
  end
end
