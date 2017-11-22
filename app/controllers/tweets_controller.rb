class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:add_favorite, :remove_favorite]


  def index
    @tweets = Tweet.order("created_at DESC").all
  end

  def show
    @tweet = Tweet.find(params[:id])
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
