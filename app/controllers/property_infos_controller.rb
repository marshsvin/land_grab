class PropertyInfosController < ApplicationController
  before_action :current_user_must_be_property_info_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_property_info_user_type
    property_info = PropertyInfo.find(params[:id])

    unless current_user == property_info.landowner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @property_infos = PropertyInfo.all
    @location_hash = Gmaps4rails.build_markers(@property_infos.where.not(:property_address_latitude => nil)) do |property_info, marker|
      marker.lat property_info.property_address_latitude
      marker.lng property_info.property_address_longitude
      marker.infowindow "<h5><a href='/property_infos/#{property_info.id}'>#{property_info.landowner_id}</a></h5><small>#{property_info.property_address_formatted_address}</small>"
    end

    render("property_infos/index.html.erb")
  end

  def show
    @property_review = PropertyReview.new
    @property_booking = PropertyBooking.new
    @property_info = PropertyInfo.find(params[:id])

    render("property_infos/show.html.erb")
  end

  def new
    @property_info = PropertyInfo.new

    render("property_infos/new.html.erb")
  end

  def create
    @property_info = PropertyInfo.new

    @property_info.landowner_id = params[:landowner_id]
    @property_info.property_address = params[:property_address]
    @property_info.property_zip_code = params[:property_zip_code]
    @property_info.property_city = params[:property_city]
    @property_info.property_state = params[:property_state]
    @property_info.property_acreage = params[:property_acreage]
    @property_info.property_description = params[:property_description]
    @property_info.property_pictures = params[:property_pictures]

    save_status = @property_info.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/property_infos/new", "/create_property_info"
        redirect_to("/property_infos")
      else
        redirect_back(:fallback_location => "/", :notice => "Property info created successfully.")
      end
    else
      render("property_infos/new.html.erb")
    end
  end

  def edit
    @property_info = PropertyInfo.find(params[:id])

    render("property_infos/edit.html.erb")
  end

  def update
    @property_info = PropertyInfo.find(params[:id])
    @property_info.property_address = params[:property_address]
    @property_info.property_zip_code = params[:property_zip_code]
    @property_info.property_city = params[:property_city]
    @property_info.property_state = params[:property_state]
    @property_info.property_acreage = params[:property_acreage]
    @property_info.property_description = params[:property_description]
    @property_info.property_pictures = params[:property_pictures]

    save_status = @property_info.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/property_infos/#{@property_info.id}/edit", "/update_property_info"
        redirect_to("/property_infos/#{@property_info.id}", :notice => "Property info updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Property info updated successfully.")
      end
    else
      render("property_infos/edit.html.erb")
    end
  end

  def destroy
    @property_info = PropertyInfo.find(params[:id])

    @property_info.destroy

    if URI(request.referer).path == "/property_infos/#{@property_info.id}"
      redirect_to("/", :notice => "Property info deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Property info deleted.")
    end
  end
end
