class Transaction < ApplicationRecord
  belongs_to :credit_card
  validates :currency, :amount, :status, :created, presence: true
  validates :status, inclusion: { in: ['fail', 'paid', 'dispute', 'refunded'] }
  validates :amount, :numericality => { greater_than: 0 }
end
