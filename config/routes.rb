Rails.application.routes.draw do
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
