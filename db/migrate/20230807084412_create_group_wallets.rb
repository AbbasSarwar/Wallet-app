class CreateGroupWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :group_wallets do |t|
      t.references :group, null: false, foreign_key: true
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
