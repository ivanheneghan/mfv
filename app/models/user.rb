class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bank_accounts
  has_many :shares

  def age
    today = Date.today
    d = Date.new(today.year, dob.month, dob.day)
    return d.year - dob.year - (d > today ? 1 : 0)
  end
end
