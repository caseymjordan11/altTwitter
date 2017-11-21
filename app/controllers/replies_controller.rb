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

    @reply = @tweet.replies.create(reply_params.merge(user: current_user))

    redirect_to tweet_path(@tweet)
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @reply = Reply.find(params[:id])

    if @reply.user == current_user
      @reply.destroy
    else
      flash[:alert] = "Only user can delete their own replies"
    end

    redirect_to tweet_path(@tweet)
  end

  private
  def reply_params
    params.require(:reply).permit(:content)
  end
end
