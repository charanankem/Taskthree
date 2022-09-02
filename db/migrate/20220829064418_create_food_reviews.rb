class CreateFoodReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :food_reviews do |t|
      t.string :restaurant_name, null: false
      t.string :location, null: false
      t.string :category, null:false


      t.timestamps
    end
  end
end
