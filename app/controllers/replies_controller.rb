class RepliesController < ApplicationController

  def show
    @reply = Reply.find(params[:id])
  end

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])

    @reply = @tweet.reply.create(reply_params)

    redirect_to tweet_path(@tweet)
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @reply = Reply.find(params[:id])
    @reply.destroy

    redirect_to tweet_path(@tweet)
  end

  private
  def tweet_params
    params.require(:reply).permit(:content)
  end
end
