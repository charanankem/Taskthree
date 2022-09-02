class FoodReview < ApplicationRecord
    has_many:reviews,as: :reviewable

    has_one_attached:profile_picture

    paginates_per 2
end
