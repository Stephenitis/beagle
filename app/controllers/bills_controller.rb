class BillsController < ApplicationController
  def show
    # Bill#to_params overriden to use bill_id instead of id
    @bill = Bill.where(bill_id: params[:id]).first
  end

  def create
    conn = Faraday.new(:url => 'http://congress.api.sunlightfoundation.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    bill_response = conn.get("/bills?bill_id=#{params[:bill_id]}&apikey=ebbcfb111bdb4b82a72694e10b776ae9")
    bill_response = JSON.parse(bill_response.body)
    bill = Bill.create(SunlightAPIParser.format_bill(response["results"][0]))

    update_response = conn.get("/floor_updates?bill_ids=#{params[:bill_id]}&apikey=ebbcfb111bdb4b82a72694e10b776ae9")
    update_response = JSON.parse(update_response.body)
    Bill.updates.create(SunlightAPIParser.format_update(update_response))

    response = conn.get("/bills?bill_id=#{params[:bill_id]}&apikey=ebbcfb111bdb4b82a72694e10b776ae9")
    redirect_to root_path
  end

end
