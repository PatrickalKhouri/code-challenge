class TransactionsController < ApplicationController
  

  def index
    # @Transactions = Transaction.all
    if params[:status]
      @transaction_no_filter = Transaction.where(credit_card_id = )
      if @transactions_no_filter.where(status: params[:status]).count >= 1
        @transactions = @Transactions_no_filter.where(status: params[:status])
        @results = @transactions.map do |transaction|
          json_transaction = { status: transaction.aasm_state, created: transaction.created, currency: transaction.currency, amount: transaction.amount }
          json_transaction
        end
        json = @results.to_json
        render json: json
      else
        @Transactions = Transaction.all
      end
    else
      @Transactions = Transaction.all
    end
  end
end
