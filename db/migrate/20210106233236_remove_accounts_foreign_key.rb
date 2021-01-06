class RemoveAccountsForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_column :credit_cards, :accounts_id
  end
end
