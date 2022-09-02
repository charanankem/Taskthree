class CreateFunctionHallReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :function_hall_reviews do |t|
      t.string :function_hall_name, null: false
      t.string :location, null: false
      t.integer :capacity, null:false


      t.timestamps
    end
  end
end
