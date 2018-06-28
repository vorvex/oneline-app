class CreateFormularCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :formular_creators do |t|
      t.string :name
      t.string :content
      
      t.timestamps
    end
  end
end
