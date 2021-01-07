class RenameAmountColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :amout, :amount
  end
end
