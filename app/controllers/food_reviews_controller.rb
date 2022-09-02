class FoodReviewsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @food_reviews = FoodReview.all.page(params[:page])
    end


    def show
        @food_review = FoodReview.find(params[:id])
        @reviewable = @food_review
        @reviews = @reviewable.reviews
        @review = Review.new
    end
    
    def new
        @food_review = FoodReview.new
    end
    
    def create
        @food_review = FoodReview.new(food_review_params)
        if @food_review.save
            flash[:success] = "your review has been created succesfully"
            redirect_to food_reviews_path
        else
          render :new, status: :unprocessable_entity
          flash[:alert] = "review not created,Try again"
        end
    end

    def edit
        @food_review = FoodReview.find(params[:id])
    end

    
    def update
        @food_review = FoodReview.find(params[:id])
        if @food_review.update(food_review_params)
            redirect_to food_reviews_path
            flash[:success] = "your review has been updated succesfully"
        else
          render :edit, status: :unprocessable_entity
          flash[:alert] = "review not updated,Try again"
        end
    end

    def destroy
        @food_review = FoodReview.find(params[:id])
        @food_review.destroy
        redirect_to food_reviews_path, status: :see_other
        flash[:success] = "review has been destroyed succesfully"
    end
    

    private
    def food_review_params
        params.require(:food_review).permit(:restaurant_name,:location,:category,:profile_picture)
    end
end
