class WidgetsController < ApplicationController
  def show
    @bill = Bill.where(bill_id: params[:bill_id])
  end

  def create
    conn = Faraday.new(:url => 'http://congress.api.sunlightfoundation.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    @response = conn.get("/bills?bill_id=#{params[:bill_id]}&apikey=ebbcfb111bdb4b82a72694e10b776ae9")
    @response = JSON.parse(@response.body)
    format_response(@response)
    render :json => @response
  end

end
