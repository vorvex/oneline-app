class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|
      t.integer	:user_id
      t.integer	:setting_id 

      t.string	:url
      t.string	:title
      t.string  :description
      t.string	:site_name
      t.integer :template	
      t.string	:google_analytics_key
      
      t.timestamps
    end
  end
end
