
class BillsSearchController < ApplicationController
	API_KEY = "ebbcfb111bdb4b82a72694e10b776ae9"
	QUERY_STRING = "https://congress.api.sunlightfoundation.com/bills?apikey=#{API_KEY}&"
	OPTIONS = [	'query',
							'highlight',
							'bill_id',
							'bill_type',
							'number',
							'congress',
							'chamber',
							'keywords',
							'history.house_passage_result',
							'history.senate_cloture_result',
							'history.senate_passage_result',
							'history.vetoed',
							'history.house_override_result',
							'history.senate_override_result',
							'history.awaiting_signature',
							'history.enacted',
							'sponsor_id',
							'cosponsor_ids',
							'withdrawn_cosponsor_ids',
							'committee_ids']

	def search_sunlight_for_bill
		result = QUERY_STRING
		redirect_to(root_path) if params.empty?

		OPTIONS.each do |option|
			params.each do |key, value|
				result << "#{key}=#{value}&" if params[key] == option
			end
		end
		render :json => {:result => result[0..-2]}
	end

end
