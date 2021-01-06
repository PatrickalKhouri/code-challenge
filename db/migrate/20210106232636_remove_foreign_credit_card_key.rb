class RemoveForeignCreditCardKey < ActiveRecord::Migration[6.0]
  def change
    remove_column :accounts, :credit_card_id
  end
end
