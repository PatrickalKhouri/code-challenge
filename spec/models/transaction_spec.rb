require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context "validation tests" do
    it 'ensures amount presence' do
      transaction = Transaction.new(currency: "usd", created:"2222222").save
      expect(transaction).to eq(false) 
    end

    it 'ensures currency presence' do
      transaction = Transaction.new(amount: 2000, created:"2222222").save
      expect(transaction).to eq(false) 
    end

    it 'ensures created presence' do
      transaction = Transaction.new(amount: 2000, currency: "usd",).save
      expect(transaction).to eq(false) 
    end
  
    it 'ensures amount is greater than 0' do
      transaction = Transaction.new(amount: -5  , currency: "usd", created: "2222222").save
      expect(transaction).to eq(false) 
    end
  end

  context "State Machine tests" do
    it 'ensures that the state changes from paid to disputed' do
      transaction = Transaction.create(currency: "usd", created:"2222222", amount: 2000)
      transaction.run
      expect(transaction.running?).to eq(true) 
    end
  end
end
