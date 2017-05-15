class RequestsController < ApplicationController
  def index
    @q = Request.ransack(params[:q])
    @requests = @q.result(:distinct => true).includes(:bookers, :property).page(params[:page]).per(10)

    render("requests/index.html.erb")
  end

  def show
    @request = Request.find(params[:id])

    render("requests/show.html.erb")
  end

  def new
    @request = Request.new

    render("requests/new.html.erb")
  end

  def create
    @request = Request.new

    @request.property_id = params[:property_id]
    @request.booking_start_date = params[:booking_start_date]
    @request.booking_end_date = params[:booking_end_date]
    @request.user_id = params[:user_id]
    @request.acceptance = params[:acceptance]
    @request.user_review = params[:user_review]

    save_status = @request.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/requests/new", "/create_request"
        redirect_to("/requests")
      else
        redirect_back(:fallback_location => "/", :notice => "Request created successfully.")
      end
    else
      render("requests/new.html.erb")
    end
  end

  def edit
    @request = Request.find(params[:id])

    render("requests/edit.html.erb")
  end

  def update
    @request = Request.find(params[:id])

    @request.property_id = params[:property_id]
    @request.booking_start_date = params[:booking_start_date]
    @request.booking_end_date = params[:booking_end_date]
    @request.user_id = params[:user_id]
    @request.acceptance = params[:acceptance]
    @request.user_review = params[:user_review]

    save_status = @request.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/requests/#{@request.id}/edit", "/update_request"
        redirect_to("/requests/#{@request.id}", :notice => "Request updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Request updated successfully.")
      end
    else
      render("requests/edit.html.erb")
    end
  end

  def destroy
    @request = Request.find(params[:id])

    @request.destroy

    if URI(request.referer).path == "/requests/#{@request.id}"
      redirect_to("/", :notice => "Request deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Request deleted.")
    end
  end
end
