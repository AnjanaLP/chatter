class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_user, except: :index

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @posts = @user.posts.paginate(page: params[:page])
    @post = current_user.posts.build if current_user
  end

  def followers
    @title = 'Followers'
    @users = @user.followers.paginate(page: params[:page])
    render 'followers_and_following'
  end

  def following
    @title = 'Following'
    @users = @user.following.paginate(page: params[:page])
    render 'followers_and_following'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
