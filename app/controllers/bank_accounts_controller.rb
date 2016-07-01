class BankAccountsController < ApplicationController

  before_action :authenticate_user!


  def index
    @bank_accounts = current_user.bank_accounts.all
  end

  def new
    @bank_account = current_user.bank_accounts.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
