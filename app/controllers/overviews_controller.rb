class OverviewsController < ApplicationController

  before_action :authenticate_user!
  before_action :build_overview

  def show
  end

  def update
    session[:future_age] = overview_params[:future_age]

    respond_to do |format|
      format.html { redirect_to overview_path }
      format.js { }
    end
  end

  private
  def overview_params
    params.require(:overview).permit(:future_age)
  end

  def build_overview
    @overview = Overview.new(current_user, (session[:future_age].to_i - current_user.age))
  end
end
