require 'pry'
require 'json'

class TransactionsController < ApplicationController
  before_action :set_product, only: [:index]

  def index
    # @Transactions = Transaction.all
    @transactions = @credit_card.transactions
    if params[:status]
      @transactions_with_filter = @transactions.where(status: params[:status])
      json = json_converter(@transactions_with_filter)
    else
      json = json_converter(@transactions)
    end 
    render json: json, limit: 5
  end

  def charge
    transaction = Transaction.new(transaction_params)  
    transaction.credit_card_id = @credit_card.id
    if transaction.valid?
      transaction.save
      json = transaction_converter(transaction)
      render json: json
    else
      error_json = { error: "Invalid inputs" }
      render json: error_json, status: 400
    end
  end

  
  private

  def json_converter(transaction_array)
    json = transaction_array.map do |transaction| 
      { id: transaction.id, created: transaction.created.to_i, status: transaction.status, amount: transaction.amount.to_i, currency: transaction.currency, credit_card_id: transaction.credit_card_id }
    end
    json
  end

  def transaction_converter(transaction)
    { id: transaction.id, created: transaction.created, status: transaction.status, amount: transaction.amount, currency: transaction.currency, credit_card_id: transaction.credit_card_id }
  end

  def set_product
    @credit_card = CreditCard.find(params[:credit_card_id])
  end

  def transaction_params
  params.require(:transaction).permit(:created, :amount, :currency)
  end
end


