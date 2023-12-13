class AddGroupToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :group_id, :bigint
    add_foreign_key :users, :groups, column: :group_id
  end
end
