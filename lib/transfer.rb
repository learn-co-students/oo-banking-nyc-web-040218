require "pry"

class Transfer

 attr_reader :sender, :receiver, :amount, :status

 @@all_transfers=[]

 def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @amount = amount
   @status = "pending"
 end

 def valid?
   @sender.valid? && @receiver.valid? && @sender.balance >= @amount
 end

 def execute_transaction
   if @status != "complete" && self.valid?
     @receiver.deposit(@amount)
     @sender.deposit(-@amount)
     @status = "complete"
   else
     @status = "rejected"
     return "Transaction rejected. Please check your account balance."
   end

 end

 def reverse_transfer
   if @status == "complete"
     @receiver.deposit(-@amount)
     @sender.deposit(@amount)
     @status = "reversed"
   end
 end


end
