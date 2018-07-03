class CreateComponents < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.integer :section_id
      
      t.string :category
      t.string :heading
      t.string :subheading
      t.string :content
      t.integer :position
      
      t.timestamps
    end
  end
end
