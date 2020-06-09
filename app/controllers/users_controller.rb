class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @post = current_user.posts.build if current_user
  end
end
