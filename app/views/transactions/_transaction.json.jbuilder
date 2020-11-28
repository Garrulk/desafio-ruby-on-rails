json.extract! transaction, :id, :kind, :transaction_date, :value, :cpf, :card_number, :transaction_hour, :store_owner, :store_name, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
