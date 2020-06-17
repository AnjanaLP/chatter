class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @post = current_user.posts.build
      @feed_posts = current_user.feed.paginate(page: params[:page])
    else
      @sample_posts = Post.all.sample(5)
    end
  end

  def contact
  end
end
