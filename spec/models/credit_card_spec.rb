require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  context "validation tests" do
    it 'ensures limit presence' do
      card = CreditCard.new(number: "2222-2222-2222-2222", cvv: "222", flag: "Visa", expiration_date: "08/2022").save
      expect(card).to eq(false) 
    end

    it 'ensures number presence' do
      card = CreditCard.new(limit: 200000, cvv: "222", flag: "Visa", expiration_date: "08/2022").save
      expect(card).to eq(false) 
    end

    it 'ensures cvv presence' do
      card = CreditCard.new(limit: 200000, number: "2222-2222-2222-2222", flag: "Visa", expiration_date: "08/2022").save
      expect(card).to eq(false) 
    end

    it 'ensures flag presence' do
      card = CreditCard.new(limit: 200000, number: "2222-2222-2222-2222", cvv:"222", expiration_date: "08/2022").save
      expect(card).to eq(false) 
    end

    it 'ensures expiration date presence' do
      card = CreditCard.new(limit: 200000, number: "2222-2222-2222-2222", cvv:"222", flag: "Visa").save
      expect(card).to eq(false) 
    end

    it 'ensures limit cant be smaller than 0' do
      card = CreditCard.new(limit: -2, number: "2222-2222-2222-2222", cvv:"222", flag: "Visa", expiration_date: "08/2022").save
      expect(card).to eq(false) 
    end

    it 'ensures there cant be other flags' do
      card = CreditCard.new(limit: -2, number: "2222-2222-2222-2222", cvv:"222", flag: "amex", expiration_date: "08/2022").save
      expect(card).to eq(false) 
    end


  end


end
