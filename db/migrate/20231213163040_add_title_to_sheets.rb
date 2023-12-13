class AddTitleToSheets < ActiveRecord::Migration[7.1]
  def change
    add_column :sheets, :title, :string
  end
end
