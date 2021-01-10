require 'aasm'

class Transaction < ApplicationRecord
  include AASM

  aasm :column_name, column: 'status' do # default column: aasm_state
    state :paid, :dispute, :failed, :refunded

    event :fail do
      transitions from: :paid, to: :failed
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
end



#A transaction status can't change from paid to failed.
#A Transaction will be automatically failed if the credit card does not have limit available.
#Once a transaction is in a disputed state, the amount of the disputed transaction is not available on the Customer credit card limit.