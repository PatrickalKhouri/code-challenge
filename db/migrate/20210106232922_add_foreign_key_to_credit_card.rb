class AddForeignKeyToCreditCard < ActiveRecord::Migration[6.0]
  def change
    add_reference :credit_cards, :accounts, index: true
  end
end
