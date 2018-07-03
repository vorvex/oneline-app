class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|
      t.integer	:user_id

      t.string	:url
      t.string	:title
      t.string  :description
      t.string	:site_name
      t.string  :layout
      t.string  :header
      t.string  :footer
      
      t.timestamps
    end
  end
end
