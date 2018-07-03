class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      
      t.integer :page_id
      
      t.string :style
      
      t.string :header_slide_one
      t.string :subheader_slide_one
      t.string :button_slide_one
      t.string :link_slide_one
      
      t.string :header_slide_two
      t.string :subheader_slide_two
      t.string :button_slide_two
      t.string :link_slide_two
      
      t.string :header_slide_three
      t.string :subheader_slide_three
      t.string :button_slide_three
      t.string :link_slide_three
      
      t.string :header_slide_four
      t.string :subheader_slide_four
      t.string :button_slide_four
      t.string :link_slide_four
      
      t.timestamps
    end
  end
end
