class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :uid, :game_uid
    add_column(:users, :provider, :string, limit: 100, null: false, default:'')
    add_column(:users, :uid, :string, limit: 100, null: false, default:'')
    add_column(:users, :avatar_url, :string)
    add_column(:users, :full_name, :string)
  end
end
