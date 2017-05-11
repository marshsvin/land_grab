class UserReviewsController < ApplicationController
  def index
    @q = UserReview.ransack(params[:q])
    @user_reviews = @q.result(:distinct => true).page(params[:page]).per(10)

    render("user_reviews/index.html.erb")
  end

  def show
    @user_review = UserReview.find(params[:id])

    render("user_reviews/show.html.erb")
  end

  def new
    @user_review = UserReview.new

    render("user_reviews/new.html.erb")
  end

  def create
    @user_review = UserReview.new


    save_status = @user_review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_reviews/new", "/create_user_review"
        redirect_to("/user_reviews")
      else
        redirect_back(:fallback_location => "/", :notice => "User review created successfully.")
      end
    else
      render("user_reviews/new.html.erb")
    end
  end

  def edit
    @user_review = UserReview.find(params[:id])

    render("user_reviews/edit.html.erb")
  end

  def update
    @user_review = UserReview.find(params[:id])


    save_status = @user_review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_reviews/#{@user_review.id}/edit", "/update_user_review"
        redirect_to("/user_reviews/#{@user_review.id}", :notice => "User review updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "User review updated successfully.")
      end
    else
      render("user_reviews/edit.html.erb")
    end
  end

  def destroy
    @user_review = UserReview.find(params[:id])

    @user_review.destroy

    if URI(request.referer).path == "/user_reviews/#{@user_review.id}"
      redirect_to("/", :notice => "User review deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "User review deleted.")
    end
  end
end
