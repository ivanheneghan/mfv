class BankAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
  
  respond_to :html

  def index
    @bank_accounts = current_user.bank_accounts
    respond_with(@bank_accounts)
  end

  def show
  end

  def new
    @bank_account = BankAccount.new
  end

  def edit
  end

  def create        
    if current_user.bank_accounts.create(bank_account_params)
      redirect_to bank_accounts_path
    else
      render :new, status: :unprocessable_entity
    end    
  end

  def update
    if @bank_account.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
    
    if @bank_account.update(bank_account_params)
      redirect_to bank_accounts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @bank_account.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end 
    if @bank_account.destroy
      redirect_to bank_accounts_path
    else
      redirect_to bank_account_path(@bank_account)
    end
  end

  private
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    def bank_account_params
      params.require(:bank_account).permit(:name, :institution, :account_type, :amount, :interest_rate)
    end
end
