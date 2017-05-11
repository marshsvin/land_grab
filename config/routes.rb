Rails.application.routes.draw do
  devise_for :user_types
  # Routes for the User_type resource:
  # READ
  get "/user_types", :controller => "user_types", :action => "index"
  get "/user_types/:id", :controller => "user_types", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
