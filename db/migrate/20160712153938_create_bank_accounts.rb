class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|

      t.timestamps
    end
  end
end
