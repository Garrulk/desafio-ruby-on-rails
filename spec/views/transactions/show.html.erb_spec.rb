require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      kind: 2,
      value: "9.99",
      cpf: "Cpf",
      card_number: "Card Number",
      store_owner: "Store Owner",
      store_name: "Store Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Card Number/)
    expect(rendered).to match(/Store Owner/)
    expect(rendered).to match(/Store Name/)
  end
end
