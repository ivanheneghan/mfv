class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @shares = Share.all
    respond_with(@shares)
  end

  def show
    respond_with(@share)
  end

  def new
    @share = Share.new
    respond_with(@share)
  end

  def edit
  end

  def create
    @share = Share.new(share_params)
    @share.save
    respond_with(@share)
  end

  def update
    @share.update(share_params)
    respond_with(@share)
  end

  def destroy
    @share.destroy
    respond_with(@share)
  end

  private
    def set_share
      @share = Share.find(params[:id])
    end

    def share_params
      params.require(:share).permit(:share_id, :name, :company, :share_price, :volume)
    end
end
