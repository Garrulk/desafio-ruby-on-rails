require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'When any of the attributes is  null' do
    it 'Is invalid if attr kind is null' do
      transaction = build(:transaction, kind: nil)
      expect(transaction).to_not be_valid
    end

    it 'Is invalid if attr transaction_date is null' do
      transaction = build(:transaction, transaction_date: nil)
      expect(transaction).to_not be_valid
    end

    it 'Is invalid if attr value is null' do
      transaction = build(:transaction, value: nil)
      expect(transaction).to_not be_valid
    end

    it 'Is invalid if attr cpf is null' do
      transaction = build(:transaction, cpf: nil)
      expect(transaction).to_not be_valid
    end

    it 'Is invalid if attr card_number is null' do
      transaction = build(:transaction, card_number: nil)
      expect(transaction).to_not be_valid
    end

    it 'Is invalid if attr transaction_hour is null' do
      transaction = build(:transaction, transaction_hour: nil)
      expect(transaction).to_not be_valid
    end

    it 'Is invalid if attr store_owner is null' do
      transaction = build(:transaction, store_owner: nil)
      expect(transaction).to_not be_valid
    end

    it 'Is invalid if attr store_name is null' do
      transaction = build(:transaction, store_name: nil)
      expect(transaction).to_not be_valid
    end
  end
end