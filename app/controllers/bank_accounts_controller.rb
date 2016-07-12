class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  respond_to :html

  def index
    @bank_accounts = BankAccount.all
    respond_with(@bank_accounts)
  end

  def show
    set_bank_account
  end

  def new
    @bank_account = BankAccount.new
    respond_with(@bank_account)
  end

  def edit
    set_bank_account
  end

  def create    
    @bank_account = BankAccount.new(bank_account_params)
    @bank_account.save
    respond_with(@bank_account)    
  end

  def update
    set_bank_account
    @bank_account.update(bank_account_params)
    respond_with(@bank_account)
  end

  def destroy
    set_bank_account
    @bank_account.destroy
    respond_with(@bank_account)
  end

  private
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    def bank_account_params
      params.require(:bank_account).permit(:name, :institution, :account_type, :amount, :interest_rate)
    end
end
