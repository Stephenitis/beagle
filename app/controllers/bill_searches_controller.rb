
class BillSearchesController < ApplicationController
	API_KEY = "ebbcfb111bdb4b82a72694e10b776ae9"
	QUERY_STRING = "https://congress.api.sunlightfoundation.com/bills?"

	def search_sunlight_for_bill
		result = QUERY_STRING
		redirect_to(root_path) if params.empty?

		result << "query=#{params[:query]}"
		
		render :json => {:result => result[0..-2]}
	end

end
