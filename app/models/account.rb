class Account < ApplicationRecord
  belongs_to :user
  has_many :credit_cards
end
