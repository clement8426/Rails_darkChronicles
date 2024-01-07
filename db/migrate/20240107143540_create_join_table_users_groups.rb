class CreateJoinTableUsersGroups < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :groups do |t|
      # t.index [:user_id, :group_id]
      # t.index [:group_id, :user_id]
    end
  end
end
