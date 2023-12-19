class ChangeUserTypeToAccountType < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :type, :account_type

  end
end
