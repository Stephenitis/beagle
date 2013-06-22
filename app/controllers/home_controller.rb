class HomeController < ApplicationController
	API_KEY = "ebbcfb111bdb4b82a72694e10b776ae9"
	QUERY_STRING = "https://congress.api.sunlightfoundation.com/bills?"
require 'json'
	def home_page
	end

  def search
    conn = Faraday.new(:url => 'http://congress.api.sunlightfoundation.com') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  end

  @response = conn.get("/bills/search?query=#{params["query"]}&apikey=ebbcfb111bdb4b82a72694e10b776ae9")
  @response = JSON.parse(@response.body)

  render :json => { :searchResponses => render_to_string(:partial => 'search_results'), :locals => {:response => @response}}

  # render :json => { :menu_template => render_to_string(:partial => 'menu', :locals => {:menu => @menu}) }
end
 # "http://congress.api.sunlightfoundation.com/bills?query=" + params[:query]
end
