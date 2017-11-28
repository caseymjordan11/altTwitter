class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: @user.id).reverse
  end

end
