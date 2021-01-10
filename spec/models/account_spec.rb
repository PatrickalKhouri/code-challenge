require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "validation tests" do
    it 'creates and account' do
        account = Account.create(user_id: User.first.id)
        expect(account.id).to eq(1) 
    end
  end
end
