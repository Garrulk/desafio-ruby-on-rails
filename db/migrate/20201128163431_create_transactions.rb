class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :kind
      t.date :transaction_date
      t.decimal :value
      t.string :cpf
      t.string :card_number
      t.time :transaction_hour
      t.string :store_owner
      t.string :store_name

      t.timestamps
    end
  end
end
