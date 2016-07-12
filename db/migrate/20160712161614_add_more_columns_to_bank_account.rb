class AddMoreColumnsToBankAccount < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :account_id, :integer
    add_column :bank_accounts, :name, :string
    add_column :bank_accounts, :institution, :string
    add_column :bank_accounts, :type, :string
    add_column :bank_accounts, :amount, :float
    add_column :bank_accounts, :interest_rate, :integer
  end
end
