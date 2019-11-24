class Api::V1::AccountsController < ApplicationController
  def index
    @accounts = Account.all
    # send it back using JSON, render these accounts as json
    render json: @accounts
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      # send it to the front end
      render json: @account
    else
      render json: {error: 'Error creting account'}
    end
  end

  def show
    @account = Account.find(params[:id])
    render json: @account
  end


  def destroy
    @account = Account.find(params[:id])
    @account.destroy
  end


  private
  # prevent account from being created
  # specify attributes that account can be created with
  def account_params
      params.require(:account).permit(:name, :balance)
  end
end
