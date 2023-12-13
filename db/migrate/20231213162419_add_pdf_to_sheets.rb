class AddPdfToSheets < ActiveRecord::Migration[7.1]
  def change
    add_column :sheets, :pdf, :string
  end
end
