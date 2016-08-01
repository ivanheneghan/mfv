class Overview

  def initialize(user, years)
    @user = user
    @years = years
  end


  # def chart_data
  #   [
  #      { name: 'thing',  value: 100 }
  #   ]
  # end

  def current_value
    bank_accounts_total + shares_total
  end

  def future_value
    @user.bank_accounts.sum { |bank_account| bank_account.future_value(@years) } + 
      shares_total
  end

  def future_value_inflation
    future_value * inflation
  end

  def bank_accounts_total
    @user.bank_accounts.sum("amount") 
  end

  def shares_total 
    @user.shares.sum(&:value)
  end

  def inflation
    1-((3/100.to_f)*(@years)) 
  end
end