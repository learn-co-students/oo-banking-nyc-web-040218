require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status, :transfer_amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @transfer_amount = 0
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.valid? && @sender.balance >= @amount
      if @receiver.valid? && @transfer_amount != @amount
        @transfer_amount = @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        return self.status = "complete"
      end
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @receiver.valid?
      if self.status == "complete"
        @receiver.balance -= @amount
        @sender.balance += @amount
        return self.status = "reversed"
      end
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
end
