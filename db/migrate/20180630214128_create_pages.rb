class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer	:website_id
      t.integer	:user_id

      t.integer	:parent_id
      t.string	:parent_name
      
      t.string :name
      t.string :template
      t.boolean :contact
      t.boolean :map
      
      t.timestamps
    end
  end
end
