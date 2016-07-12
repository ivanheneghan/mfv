class ChangeNames < ActiveRecord::Migration
  def change
    rename_column :bank_accounts, :type, :account_type
  end
end
