class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.integer :limit
      t.string :number
      t.string :cvv
      t.string :expiration_date
      t.string :flag

      t.timestamps
    end
  end
end
