class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :name
      t.string :strasse
      t.string :adresszusatz
      t.string :stadt
      t.integer :plz
      t.string :ceo
      t.string :beauftragter
      
      t.timestamps
    end
  end
end
