class CreateAdvantageDisadvantages < ActiveRecord::Migration[7.1]
  def change
    create_table :advantage_disadvantages do |t|
      t.string :name
      t.integer :value
      t.references :sheet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
