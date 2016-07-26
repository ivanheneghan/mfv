class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :share_id
      t.string :name
      t.string :company
      t.float :share_price
      t.integer :volume

      t.timestamps
    end
  end
end
