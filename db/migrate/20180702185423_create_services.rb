class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      
      t.integer :page_id
      
      t.string :style
      
      t.string :header_service_one
      t.string :description_service_one
      t.string :button_service_one
      t.string :link_service_one
      
      t.string :header_service_two
      t.string :description_service_two
      t.string :button_service_two
      t.string :link_service_two
      
      t.string :header_service_three
      t.string :description_service_three
      t.string :button_service_three
      t.string :link_service_three
      
      t.string :header_service_four
      t.string :description_service_four
      t.string :button_service_four
      t.string :link_service_four
      
      t.timestamps
    end
  end
end
