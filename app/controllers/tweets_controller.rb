class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    redirect_to tweet_path(@tweet)
  end


  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    redirect_to tweets_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
