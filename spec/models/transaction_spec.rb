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
      transaction.approve
      transaction.disputed
      expect(transaction.dispute?).to eq(true) 
    end

    it 'ensures that the state changes from disputed to paid' do
      transaction = Transaction.create(currency: "usd", created:"2222222", amount: 2000)
      transaction.approve
      transaction.disputed
      transaction.pay
      expect(transaction.paid?).to eq(true) 
    end

    it 'ensures that the state changes from disputed to refunded' do
      transaction = Transaction.create(currency: "usd", created:"2222222", amount: 2000)
      transaction.approve
      transaction.disputed
      transaction.refund
      expect(transaction.refunded?).to eq(true) 
    end

    it 'ensures that inital state is pending' do
      transaction = Transaction.create(currency: "usd", created:"2222222", amount: 2000)
      expect(transaction.pending?).to eq(true) 
    end
  end
end
