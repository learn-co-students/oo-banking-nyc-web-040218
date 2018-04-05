require 'pry'

class Transfer


attr_reader :sender, :receiver, :amount
attr_accessor :status

def initialize(sender, receiver, transfer_amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = transfer_amount
end

def valid?
  if sender.valid? == true && receiver.valid? == true
    true
  else
    false
  end
end

def execute_transaction
  # sender - amount     reciever + amount
  if self.valid? == true && @amount <= sender.balance && @status == "pending"
    sender.balance -= @amount
    receiver.balance += @amount
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
    sender.balance += @amount
    receiver.balance -= @amount
    @status = "reversed"
  else
    "I can't do that, Dave."
  end
end

end
