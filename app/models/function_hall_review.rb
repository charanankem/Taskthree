class FunctionHallReview < ApplicationRecord
    has_many:reviews,as: :reviewable

    has_one_attached:profile_image

    paginates_per 2
end
