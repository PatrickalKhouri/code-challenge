class CreditCard < ApplicationRecord
  has_many :transactions
  belongs_to :account
  validates :limit, :cvv, :expiration_date, :flag, :number,  presence: true
  validates :flag, inclusion: { in: ['Visa', 'Mastercard'] }
  validates :limit, :numericality => { greater_than: 0 }
end
