class Api::V1::TransactionsController < ApplicationController
  before_action :set_account

  def index
    @transactions = @account.transactions
    render json: @transactions
  end


  def show
    @transaction = @account.transactions.find_by(id: params[:id])
    render json: @transaction
  end

  def create
    @transaction = @account.transactions.new(transaction_params)
    if @account.update_balance(@transaction) != 'Balance too low.'
      @transaction.save
      render json: @account
    else
      render json: {error: 'Balance too low'}
    end
  end

  def destroy
    @transaction = Transaction.find(params["id"])
    @account = Account.find(@transaction.account_id)
    if @account.update_balance_after_transaction_removal(@transaction)  != 'Balance too low'
      @transaction.destroy
      render json: @account
    else
      render json: {error: 'Balance too low'}
    end

  end


  private

  def set_account
    @account = Account.find(params[:account_id])
  end

  def transaction_params
      params.require(:transaction).permit(:account_id, :date, :trans_type, :amount, :description)

  end

end
