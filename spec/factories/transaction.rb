FactoryBot.define do
  factory :transaction do
    kind { FFaker::Random.rand(0..9) }
    transaction_date { FFaker::Time.date }
    value { (FFaker::Random.rand(1000..9999) / 100) }
    cpf { FFaker::Random.rand(10000000000..99999999999) }
    card_number { FFaker::Lorem.word }
    transaction_hour { FFaker::Random.rand(100000..999999) }
    store_owner { FFaker::Name.first_name }
    store_name { FFaker::Lorem.phrase }
  end

end