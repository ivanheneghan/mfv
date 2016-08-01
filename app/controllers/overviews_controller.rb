class OverviewsController < ApplicationController

  before_action :authenticate_user!

  def show
    @overview = Overview.new(current_user, (session[:future_age].to_i - current_user.age)).to_hash
  end

  def update
    session[:future_age] = overview_params[:future_age]
    redirect_to overview_path
  end

  private
  def overview_params
    params.require(:overview).permit(:future_age)
  end
end
