class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      
      t.integer :website_id
      t.string :primary_color
      t.string :secondary_color
      t.string :tertiary_color
      t.string :background_color
      t.string :font
      
      t.timestamps
    end
  end
end
