require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        kind: 2,
        value: "9.99",
        cpf: "Cpf",
        card_number: "Card Number",
        store_owner: "Store Owner",
        store_name: "Store Name"
      ),
      Transaction.create!(
        kind: 2,
        value: "9.99",
        cpf: "Cpf",
        card_number: "Card Number",
        store_owner: "Store Owner",
        store_name: "Store Name"
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Cpf".to_s, count: 2
    assert_select "tr>td", text: "Card Number".to_s, count: 2
    assert_select "tr>td", text: "Store Owner".to_s, count: 2
    assert_select "tr>td", text: "Store Name".to_s, count: 2
  end
end
