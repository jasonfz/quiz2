class ReviewsController < ApplicationController

    before_action :find_idea
    before_action :authenticate_user!
    # before_action :authorize_user!, only: [:destroy]

    def create
        @review = Review.new(review_params)
        @review.idea = @idea
        @review.user = current_user
        if @review.save
          flash[:success] = "Reviews successfully created"
          redirect_to @idea
        else
          @reviews = @idea.reviews.order(created_at: :desc)
          render '/ideas/show', status: 303
        end
      end

  def destroy
    @review = Review.find params[:id]
    # if can?(:crud, @review)
      @review.destroy
      redirect_to idea_path(@review.idea)
      flash[:success] = "Review deleted"
    # else
    #     redirect_to root_path, alert: "Not athorized to change Review!"
    #   end
    
  end

    private

    def find_idea
      @idea = Idea.find params[:idea_id]
    end
   
    def review_params
      params.require(:review).permit(:body)
    end

end
