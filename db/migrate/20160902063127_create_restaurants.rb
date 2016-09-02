class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :reviews_count
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :avg_rating

      t.timestamps
    end
  end
end
