class CreateNpcs < ActiveRecord::Migration[7.1]
  def change
    create_table :npcs do |t|
      t.string :name
      t.string :clan
      t.string :secte
      t.string :generation
      t.string :address
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
