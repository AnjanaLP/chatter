class ApplicationController < ActionController::Base

  include DeviseWhitelist

  def after_sign_in_path_for(resource)
    session["user_return_to"] || root_path
  end
end
