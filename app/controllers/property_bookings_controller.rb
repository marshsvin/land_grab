class PropertyBookingsController < ApplicationController
  def index
    @property_bookings = PropertyBooking.all

    render("property_bookings/index.html.erb")
  end

  def show
    @property_booking = PropertyBooking.find(params[:id])

    render("property_bookings/show.html.erb")
  end

  def new
    @property_booking = PropertyBooking.new

    render("property_bookings/new.html.erb")
  end

  def create
    @property_booking = PropertyBooking.new

    @property_booking.property_id = params[:property_id]
    @property_booking.booking_start_date = params[:booking_start_date]
    @property_booking.booking_end_date = params[:booking_end_date]
    @property_booking.bookers_id = params[:bookers_id]

    save_status = @property_booking.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/property_bookings/new", "/create_property_booking"
        redirect_to("/property_bookings")
      else
        redirect_back(:fallback_location => "/", :notice => "Property booking created successfully.")
      end
    else
      render("property_bookings/new.html.erb")
    end
  end

  def edit
    @property_booking = PropertyBooking.find(params[:id])

    render("property_bookings/edit.html.erb")
  end

  def update
    @property_booking = PropertyBooking.find(params[:id])

    @property_booking.property_id = params[:property_id]
    @property_booking.booking_start_date = params[:booking_start_date]
    @property_booking.booking_end_date = params[:booking_end_date]
    @property_booking.bookers_id = params[:bookers_id]

    save_status = @property_booking.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/property_bookings/#{@property_booking.id}/edit", "/update_property_booking"
        redirect_to("/property_bookings/#{@property_booking.id}", :notice => "Property booking updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Property booking updated successfully.")
      end
    else
      render("property_bookings/edit.html.erb")
    end
  end

  def destroy
    @property_booking = PropertyBooking.find(params[:id])

    @property_booking.destroy

    if URI(request.referer).path == "/property_bookings/#{@property_booking.id}"
      redirect_to("/", :notice => "Property booking deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Property booking deleted.")
    end
  end
end
