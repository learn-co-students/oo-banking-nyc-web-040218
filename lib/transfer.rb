require "pry"
class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    #(.balance > 0 && @status == 'open') ? true : false

    # if @sender.valid? == true && @receiver.valid? == true
    #   true
    # else
    #   false
    # end
    (sender.valid? == true && receiver.valid? == true) ? true : false
  end

  def execute_transaction
    # binding.pry
    if self.valid? == true && sender.balance >= @amount && self.status != 'complete'
        sender.balance -= @amount
        receiver.balance += @amount
        self.status = 'complete'
    else
        @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    # else sender.status == 'closed'
    end
  end

  def reverse_transfer
    if self.valid? == true && receiver.balance >= @amount && self.status == 'complete'
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = 'reversed'
    else
      self.status
    end

  end



end
