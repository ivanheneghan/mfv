module ApplicationHelper

  def future_age
    if current_user
      session[:future_age] ||= current_user.age 
    end
    session[:future_age]
  end
end
