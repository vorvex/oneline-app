class ChangeSections < ActiveRecord::Migration[5.2]
  def change
    change_column :sections, :category, :string
  end
end
