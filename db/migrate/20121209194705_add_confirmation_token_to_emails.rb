class AddConfirmationTokenToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :confirmation_token, :string, limit: 20, null: false
    add_index :emails, :confirmation_token, unique: true
  end
end
