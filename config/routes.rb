Rails.application.routes.draw do
  # Routes for the User_review resource:
  # CREATE
  get "/user_reviews/new", :controller => "user_reviews", :action => "new"
  post "/create_user_review", :controller => "user_reviews", :action => "create"

  # READ
  get "/user_reviews", :controller => "user_reviews", :action => "index"
  get "/user_reviews/:id", :controller => "user_reviews", :action => "show"

  # UPDATE
  get "/user_reviews/:id/edit", :controller => "user_reviews", :action => "edit"
  post "/update_user_review/:id", :controller => "user_reviews", :action => "update"

  # DELETE
  get "/delete_user_review/:id", :controller => "user_reviews", :action => "destroy"
  #------------------------------

  # Routes for the Property_review resource:
  # CREATE
  get "/property_reviews/new", :controller => "property_reviews", :action => "new"
  post "/create_property_review", :controller => "property_reviews", :action => "create"

  # READ
  get "/property_reviews", :controller => "property_reviews", :action => "index"
  get "/property_reviews/:id", :controller => "property_reviews", :action => "show"

  # UPDATE
  get "/property_reviews/:id/edit", :controller => "property_reviews", :action => "edit"
  post "/update_property_review/:id", :controller => "property_reviews", :action => "update"

  # DELETE
  get "/delete_property_review/:id", :controller => "property_reviews", :action => "destroy"
  #------------------------------

  # Routes for the Property_booking resource:
  # CREATE
  get "/property_bookings/new", :controller => "property_bookings", :action => "new"
  post "/create_property_booking", :controller => "property_bookings", :action => "create"

  # READ
  get "/property_bookings", :controller => "property_bookings", :action => "index"
  get "/property_bookings/:id", :controller => "property_bookings", :action => "show"

  # UPDATE
  get "/property_bookings/:id/edit", :controller => "property_bookings", :action => "edit"
  post "/update_property_booking/:id", :controller => "property_bookings", :action => "update"

  # DELETE
  get "/delete_property_booking/:id", :controller => "property_bookings", :action => "destroy"
  #------------------------------

  # Routes for the Property_info resource:
  # CREATE
  get "/property_infos/new", :controller => "property_infos", :action => "new"
  post "/create_property_info", :controller => "property_infos", :action => "create"

  # READ
  get "/property_infos", :controller => "property_infos", :action => "index"
  get "/property_infos/:id", :controller => "property_infos", :action => "show"

  # UPDATE
  get "/property_infos/:id/edit", :controller => "property_infos", :action => "edit"
  post "/update_property_info/:id", :controller => "property_infos", :action => "update"

  # DELETE
  get "/delete_property_info/:id", :controller => "property_infos", :action => "destroy"
  #------------------------------

  devise_for :user_types
  # Routes for the User_type resource:
  # READ
  get "/user_types", :controller => "user_types", :action => "index"
  get "/user_types/:id", :controller => "user_types", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
