class RenameAdvantageDisadvantagesToAdvantages < ActiveRecord::Migration[7.1]
  def change
    rename_table :advantage_disadvantages, :advantages
  end
end
