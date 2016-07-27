class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_share, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @shares = current_user.shares
    respond_with(@shares)
  end

  def show
  end

  def new
    @share = Share.new    
  end

  def edit
  end

def create        
    if current_user.shares.create(share_params)
      redirect_to shares_path
    else
      render :new, status: :unprocessable_entity
    end    
  end

  def update
    if @share.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
    
    if @share.update(share_params)
      redirect_to shares_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @share.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end 
    if @share.destroy
      redirect_to shares_path
    else
      redirect_to share_path(@share)
    end
  end

  private
    def set_share
      @share = Share.find(params[:id])
    end

    def share_params
      params.require(:share).permit(:share_id, :company, :ticker, :volume)
    end
end
