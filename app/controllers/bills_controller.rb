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
    #bill update call
    bill_response = conn.get("/bills?bill_id=#{params[:bill_id]}&apikey=ebbcfb111bdb4b82a72694e10b776ae9")
    bill_response = JSON.parse(bill_response.body)
    puts bill_response
    bill = Bill.create(SunlightAPIParser.format_bill(bill_response["results"][0]))
    ### floor update call
    update_response = conn.get("/floor_updates?bill_ids=#{params[:bill_id]}&apikey=ebbcfb111bdb4b82a72694e10b776ae9")
    update_response = JSON.parse(update_response.body)
    if update_response["results"].try(:first)
      update_response["results"].each do |resp|
        bill.updates.create(SunlightAPIParser.format_update(resp))
      end
    end
    ###vote update call
    vote_response = conn.get("/votes?bill_id=#{params[:bill_id]}&apikey=ebbcfb111bdb4b82a72694e10b776ae9")

    updated_vote_response = JSON.parse(vote_response.body)
    if updated_vote_response["results"].try(:first)
      updated_vote_response["results"].each do |vote_update|
        bill.updates.create(SunlightAPIParser.format_vote_update(vote_update))
      end
    end
    response = conn.get("/bills?bill_id=#{params[:bill_id]}&apikey=ebbcfb111bdb4b82a72694e10b776ae9")
    redirect_to bill_path(bill)
  end

end
