require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context "validation tests" do
    it 'ensures amount presence' do
      transaction = Transaction.new(currency: "usd", status: "paid", created:"2222222").save
      expect(transaction).to eq(false) 
    end

    it 'ensures currency presence' do
      transaction = Transaction.new(amount: 2000, status: "paid", created:"2222222").save
      expect(transaction).to eq(false) 
    end

    it 'ensures status presence' do
      transaction = Transaction.new(amount: 2000, currency: "usd", created:"2222222").save
      expect(transaction).to eq(false) 
    end
    
    it 'ensures created presence' do
      transaction = Transaction.new(amount: 2000, currency: "usd", status:"paid").save
      expect(transaction).to eq(false) 
    end
  
    it 'ensures amount is greater than 0' do
      transaction = Transaction.new(amount: -5  , currency: "usd", status:"paid", created: "2222222").save
      expect(transaction).to eq(false) 
    end
  end
end
