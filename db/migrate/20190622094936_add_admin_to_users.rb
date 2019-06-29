class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, default: false, null: false
  end
end

#default 値を false（一般ユーザー）とし、これが true だと管理者権限を持つユーザーとなる。