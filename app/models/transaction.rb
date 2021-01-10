require 'aasm'

class Transaction < ApplicationRecord
  include AASM

  aasm :column_name, column: 'status' do # default column: aasm_state
    state :pending, initial: true
    state :paid, :dispute, :failed, :refunded

    #after_transition

    event :fail do
      transitions from: :pending, to: :failed
    end

    event :approve do
      transitions from: :pending, to: :paid
    end

    event :disputed do
      transitions from: :paid, to: :dispute
    end

    event :refund do
      transitions from: :dispute, to: :refunded
    end

    event :pay do
      transitions from: :dispute, to: :paid
    end
  end


  belongs_to :credit_card
  validates :currency, :amount, :created, presence: true
  validates :amount, :numericality => { greater_than: 0 }

  def approve_transaction
    if limit_left
      approve
    else
      fail
    end
  end

  def limit_left
    remaining_limit = self.credit_card.limit - self.amount
    remaining_limit >= 0 ? true : false
  end
end



#A transaction status can't change from paid to failed.
#A Transaction will be automatically failed if the credit card does not have limit available.
#Once a transaction is in a disputed state, the amount of the disputed transaction is not available on the Customer credit card limit.