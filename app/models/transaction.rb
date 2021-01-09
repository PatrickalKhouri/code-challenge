require 'aasm'

class Transaction < ApplicationRecord
  include AASM

  aasm do
    state :sleeping, initial: true
    state :running, :cleaning

    event :run do
      transitions from: :sleeping, to: :running
    end

    event :clean do
      transitions from: :running, to: :cleaning
    end

    event :sleep do
      transitions from: [:running, :cleaning], to: :sleeping
    end
  end


  belongs_to :credit_card
  validates :currency, :amount, :created, presence: true
  validates :amount, :numericality => { greater_than: 0 }
end



#A transaction status can't change from paid to failed.
#A Transaction will be automatically failed if the credit card does not have limit available.
#Once a transaction is in a disputed state, the amount of the disputed transaction is not available on the Customer credit card limit.