class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      
      t.integer	:page_id
      t.integer :position
      t.string 	:category
      t.string 	:header
      t.string  :subheader

      t.string  :background
      
      t.timestamps
    end
  end
end
