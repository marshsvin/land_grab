class UserTypesController < ApplicationController
  def index
    @user_types = UserType.all
  end

  def show
    @user_type = UserType.find(params[:id])
  end
end
