class ApplicationController < ActionController::Base
  before_action :authenticate_user_type!

  protect_from_forgery with: :exception
end
