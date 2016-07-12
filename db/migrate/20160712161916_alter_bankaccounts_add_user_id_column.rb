class AlterBankaccountsAddUserIdColumn < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :user_id, :integer
    add_index :bank_accounts, :user_id
  end
end
