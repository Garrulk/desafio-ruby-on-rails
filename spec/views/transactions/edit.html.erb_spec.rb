require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      kind: 1,
      value: "9.99",
      cpf: "MyString",
      card_number: "MyString",
      store_owner: "MyString",
      store_name: "MyString"
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input[name=?]", "transaction[kind]"

      assert_select "input[name=?]", "transaction[value]"

      assert_select "input[name=?]", "transaction[cpf]"

      assert_select "input[name=?]", "transaction[card_number]"

      assert_select "input[name=?]", "transaction[store_owner]"

      assert_select "input[name=?]", "transaction[store_name]"
    end
  end
end
