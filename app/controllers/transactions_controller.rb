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
    render json: json
    #end
  end

  
  private

  def json_converter(transaction_array)
    json = transaction_array.map { |transaction| {id: transaction.id, created: transaction.created.to_i, status: transaction.status,  amount: transaction.amount.to_i, currency: transaction.currency, credit_card_id: transaction.credit_card_id } }
    json
  end

  def set_product
    @credit_card = CreditCard.find(params[:credit_card_id])
  end

  def transaction_params
    params.require(:transaction).permit(:status, :created, :amount, :currency)
  end
end


