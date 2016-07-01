class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|

      t.string :name
      t.string :institution
      t.string :type
      t.float :amount
      t.integer :interest_rate
      t.references :user

      t.timestamps
    end
  end
end
