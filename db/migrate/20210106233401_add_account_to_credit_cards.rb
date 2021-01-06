class AddAccountToCreditCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :credit_cards, :account, null: false, foreign_key: true
  end
end
