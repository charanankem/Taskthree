class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :load_reviewable


    def index
        @reviews = Review.all
    end
    
    def show
        @review = Review.find(params[:id])
    end
    
    def new
        @review = @reviewable.reviews.new
    end
    
    def create
        @review = @reviewable.reviews.new(review_params)
        if @review.save!
            flash[:success] = "your review has been created succesfully"
            redirect_to [@reviewable]
        else
          render :new, status: :unprocessable_entity
          flash[:alert] = "review not created,Try again"
        end
    end

    def edit
        @review = Review.find(params[:id])
    end

    
    def update
        @review = Review.find(params[:id])
        if @review.update(review_params)
            redirect_to reviews_path
            flash[:success] = "your review has been updated succesfully"
        else
          render :edit, status: :unprocessable_entity
          flash[:alert] = "review not updated,Try again"
        end
    end

    def destroy
        @review = DeliveryReview.find(params[:id])
        @review.destroy
        redirect_to reviews_path, status: :see_other
        flash[:success] = "review has been destroyed succesfully"
    end
    
    private
    def load_reviewable
        resource, id = request.path.split('/')[1,2]
        @reviewable = resource.singularize.classify.constantize.find(id)
    end


    private
    def review_params
        params.require(:review).permit(:review_text,:suggestion,:reviewable_type,:reviewable_id,:user_id)
    end
end
