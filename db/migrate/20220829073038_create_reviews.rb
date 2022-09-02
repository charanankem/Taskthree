class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :review_text, null:false
      t.string :suggestion
      t.references :user, null: false, foreign_key: true
      t.references :reviewable, polymorphic: true

      t.timestamps
    end
  end
end
