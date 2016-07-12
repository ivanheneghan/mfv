class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  respond_to :html

  def index
    @bank_accounts = BankAccount.all
    respond_with(@bank_accounts)
  end

  def show
    respond_with(@bank_account)
  end

  def new
    @bank_account = BankAccount.new
    respond_with(@bank_account)
  end

  def edit
  end

  def create
    current_user.bank_accounts.create(bank_account_params)
    @bank_account = BankAccount.new(bank_account_params)
    @bank_account.save
    respond_with(@bank_account)
  end

  def update
    @bank_account.update(bank_account_params)
    respond_with(@bank_account)
  end

  def destroy
    @bank_account.destroy
    respond_with(@bank_account)
  end

  private
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    def bank_account_params
      params[:bank_account]
    end
end
