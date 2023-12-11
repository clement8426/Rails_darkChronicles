class AddCoordinatesToNpcs < ActiveRecord::Migration[7.1]
  def change
    add_column :npcs, :latitude, :float
    add_column :npcs, :longitude, :float
  end
end
