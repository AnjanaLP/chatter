class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Your post is live!"
      redirect_to(request.referrer || root_path)
    else
      flash[:alert] = @post.errors.full_messages.to_sentence
      redirect_to(request.referrer || root_path)
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
