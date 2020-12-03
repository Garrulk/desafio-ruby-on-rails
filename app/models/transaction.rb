class Transaction < ApplicationRecord
  validates :kind, :transaction_date, :value, :cpf, :card_number,
            :transaction_hour, :store_owner, :store_name, presence: true
end
