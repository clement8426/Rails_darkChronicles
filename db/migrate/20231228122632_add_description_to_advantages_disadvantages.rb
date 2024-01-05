class AddDescriptionToAdvantagesDisadvantages < ActiveRecord::Migration[7.1]
  def change
    add_column :advantage_disadvantages, :description, :text
  end
end
