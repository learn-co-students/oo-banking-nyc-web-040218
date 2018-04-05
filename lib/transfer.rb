require_relative '../lib/bank_account'

require "pry"

class Transfer

  attr_accessor :sender, :receiver, :amount, :status
  # attr_reader 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance > amount
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      
      sender.balance-= amount
      receiver.balance+= amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance+= amount
      receiver.balance-= amount
      @status = "reversed"
    end
    
  end

end


