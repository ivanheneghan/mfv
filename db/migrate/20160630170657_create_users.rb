class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name
      t.string :dob
      t.float :salary
      t.float :bonus
      t.float :savings_per_month
      
      t.timestamps
    end
  end
end
