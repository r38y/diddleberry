class ShortenEmailToken < ActiveRecord::Migration
  def up
    change_column :emails, :confirmation_token, :string, limit: 10, null: true
  end

  def down
    change_column :emails, :confirmation_token, :string, limit: 20, null: false
  end
end
