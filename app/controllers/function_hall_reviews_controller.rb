class FunctionHallReviewsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @function_hall_reviews = FunctionHallReview.all.page(params[:page])
    end
    
    def show
        @function_hall_review = FunctionHallReview.find(params[:id])
        @reviewable = @function_hall_review
        @reviews = @reviewable.reviews
        @review = Review.new
    end
    
    def new
        @function_hall_review = FunctionHallReview.new
    end
    
    def create
        @function_hall_review = FunctionHallReview.new(function_hall_review_params)
        if @function_hall_review.save
            flash[:success] = "your review has been created succesfully"
            redirect_to function_hall_reviews_path
        else
          render :new, status: :unprocessable_entity
          flash[:alert] = "review not created,Try again"
        end
    end

    def edit
        @function_hall_review = FunctionHallReview.find(params[:id])
    end

    
    def update
        @function_hall_review = FunctionHallReview.find(params[:id])
        if @function_hall_review.update(function_hall_review_params)
            redirect_to function_hall_reviews_path
            flash[:success] = "your review has been updated succesfully"
        else
          render :edit, status: :unprocessable_entity
          flash[:alert] = "review not updated,Try again"
        end
    end

    def destroy
        @function_hall_review = FunctionHallReview.find(params[:id])
        @function_hall_review.destroy
        redirect_to function_hall_reviews_path, status: :see_other
        flash[:success] = "review has been destroyed succesfully"
    end
    

    private
    def function_hall_review_params
        params.require(:function_hall_review).permit(:function_hall_name,:location,:capacity,:profile_image)
    end
end
