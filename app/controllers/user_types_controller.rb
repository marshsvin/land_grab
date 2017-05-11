class UserTypesController < ApplicationController
  def index
    @user_types = UserType.page(params[:page]).per(10)
  end

  def show
    @user_type = UserType.find(params[:id])
  end
end
