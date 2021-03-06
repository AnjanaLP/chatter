module ApplicationHelper

  def full_title (page_title = "")
    base_title = "Chatter"
    page_title.empty? ? base_title : base_title + " | " + page_title
  end

  def paginate(collection)
    will_paginate collection, renderer: WillPaginate::ActionView::Bootstrap4LinkRenderer
  end

  def current_user?(user)
    current_user && current_user == user
  end
end
