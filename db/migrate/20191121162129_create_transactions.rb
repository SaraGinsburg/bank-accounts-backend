class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.datetime :date
      t.string :trans_type
      t.float :amount
      t.string :description

      t.timestamps
    end
  end
end
