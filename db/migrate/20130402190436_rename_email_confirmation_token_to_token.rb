class RenameEmailConfirmationTokenToToken < ActiveRecord::Migration
  def up
    rename_column :emails, :confirmation_token, :token
  end

  def down
    rename_column :emails, :token, :confirmation_token
  end
end
