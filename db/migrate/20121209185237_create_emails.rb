class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address, null: false
      t.datetime :confirmed_at
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :emails, :address, unique: true
    add_index :emails, :user_id
  end
end
