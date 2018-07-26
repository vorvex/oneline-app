class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :name

      t.string :ceo
      t.string :beauftragter
      
      t.string :url
      
      t.string :field
      
      t.string :provider
      t.string :uid 
      t.string :gname 
      t.string :oauth_token 
      t.datetime :oauth_expires_at
      
      t.string :formatted_address
      t.string :route
      t.string :street_number
      t.string :postal_code
      t.string :locality
      t.string :place_id
      t.string :lat
      t.string :lng
      
      t.timestamps
    end
  end
end
