class AddToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :datetime
    add_column :users, :salary, :float
    add_column :users, :bonus, :float
    add_column :users, :savings_per_month, :float
  end
end
