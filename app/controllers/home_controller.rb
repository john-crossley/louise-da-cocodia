class HomeController < ApplicationController

  def index
  	@content_for_title = "Home"
  	# @posts = Post.where('created_at DESC')
  	@posts = Post.all
    @events = Event.order('created_at DESC').limit(3)
  end

  def gocardless
    # Set up donation

    # todo: Validate and make sure we have an int.

    url_params = {
      amount: params[:amount],
      name: 'Louise Da-Cocodia Donation'
    }
    url = GoCardless.new_bill_url(url_params)
    redirect_to url
  end

  def confirm_payment
    @donation = Donation.new
    # render 'gocardless/success'
    GoCardless.confirm_resource params
    render 'gocardless/success'
  rescue GoCardless::ApiError => e
    render text: "Could not conform new subscription. Details #{e}"
  end

end