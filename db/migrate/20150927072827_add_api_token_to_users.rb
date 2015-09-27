class AddApiTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :api_token, :string, null: false, default: ''
    add_index :users, :api_token, unique: true
  end
end
