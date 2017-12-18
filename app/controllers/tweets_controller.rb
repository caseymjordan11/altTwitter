class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:add_favorite, :remove_favorite]


  def index
    if user_signed_in?
      @tweets = Tweet.where(user_id: current_user.following.ids.push(current_user.id)).reverse
    else
      redirect_to authenticate_user!
    end
    # instead of using this if / else above, why not just include index in the before_action above?
    @users = User.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @users = User.all
    # I don't think you should need to pass in the full list of users. Check out my comments
    # in the show view for more info.
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params.merge(user: current_user))
    redirect_to tweets_path
  end


  def destroy
    @tweet = Tweet.find(params[:id])

    if @tweet.user == current_user
      @tweet.destroy
    else
      flash[:alert]= "only user can delete own tweets"
    end

    redirect_to tweets_path
  end

  def add_favorite
    @tweet = Tweet.find(params[:id])
    @tweet.favorites.create(user: current_user)
    redirect_to tweets_path
  end

  def remove_favorite
    Favorite.find_by(user: current_user, tweet_id: params[:id]).destroy
    redirect_to tweets_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
