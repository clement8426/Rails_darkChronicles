class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :type, :string
    add_column :users, :description, :string
  end
end
