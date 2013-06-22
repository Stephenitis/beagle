class HomeController < ApplicationController
	API_KEY = "ebbcfb111bdb4b82a72694e10b776ae9"
	QUERY_STRING = "https://congress.api.sunlightfoundation.com/bills?"
  require 'json'
	def home_page
		result = QUERY_STRING
		redirect_to(root_path) if params.empty?
		result << "query=#{params[:query]}"
	end

  def search
    conn = Faraday.new(:url => 'http://congress.api.sunlightfoundation.com') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

  @response = conn.get("/bills?query=immigration&apikey=ebbcfb111bdb4b82a72694e10b776ae9")
  @response = JSON.parse(@response.body)

  end


 # "http://congress.api.sunlightfoundation.com/bills?query=" + params[:query]
end
