class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :kind
      t.date :transaction_date
      t.float :value, precision: 10, scale: 2
      t.string :cpf
      t.string :card_number
      t.string :transaction_hour
      t.string :store_owner
      t.string :store_name

      t.timestamps
    end
  end
end
