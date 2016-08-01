class BankAccount < ActiveRecord::Base
  belongs_to :user
  validates :name, :institution, :account_type, length: {minimum: 3}, presence: true
  validates :amount, numericality: { only_integer: true }, presence: true
  validates :interest_rate, numericality: { only_integer: true }, presence: true


  def future_value(years)
    amount*((1+(interest_rate.to_f/100))**years) 
  end
end
