class ChangeShareDb < ActiveRecord::Migration
  def change
    remove_column :shares, :name
    remove_column :shares, :share_price
    add_column :shares, :ticker, :string
  end
end
