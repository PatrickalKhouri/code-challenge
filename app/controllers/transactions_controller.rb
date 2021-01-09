class TransactionsController < ApplicationController
  before_action :set_product, only: [:index]

  def index
    # @Transactions = Transaction.all
    @transactions = @credit_card.transactions
    @transaction_with_status = @transactions.map do |transaction|
      transaction[:status] = transaction.aasm_state
    end

    if params[:status]
        @transactions_with_filter = @Transactions_no_filter.where(status: params[:status])
        @results = @transactions_with_filter.map do |transaction|
          json_converter(transaction)
        end
        render_json(@results)
    else
      @results = @transactions_with_filter.map do |transaction|
        json_converter(transaction)
      end
      render_json(@results)
    end
  end

  
  private

  def render_json(array)
    json = @array.to_json
    render json: json
  end

  def json_converter(transaction)
    json_transaction = { status: transaction.status, created: transaction.created, currency: transaction.currency, amount: transaction.amount }
    json_transaction
  end

  def set_product
    @credit_card = CreditCard.find(params[:credit_card_id])
  end

  def transaction_params
    params.require(:transaction).permit(:status, :created, :amount, :currency)
  end
end


