class AddSessionTokenToUsers < ActiveRecord::Migration[6.0]
  def change 
    add_column :users, :session_token, :string, default: nil
  end
end
