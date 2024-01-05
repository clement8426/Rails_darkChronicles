class CreateDisadvantages < ActiveRecord::Migration[7.1]
  def change
    create_table :disadvantages do |t|
      t.string :name
      t.integer :value
      t.references :sheet, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
