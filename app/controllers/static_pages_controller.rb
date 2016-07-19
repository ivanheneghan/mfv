class StaticPagesController < ApplicationController
  def index
    if current_user
      redirect_to overview_path
    end
  end
end
