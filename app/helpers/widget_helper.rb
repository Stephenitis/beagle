module WidgetHelper
	def format_response(response)
		{
		:bill_id => response["bill_id"]
		:bill_type => response["bill_type"]
		:number => response["number"]
		:congress => response["congress"]
		:introduced_on => response["introduced_on"]
		:last_action_at => response["last_action_at"]
		:last_vote_at => response["last_vote_at"]
		:official_title => response["official_title"]
		:popular_title => response["popular_title"]
		:short_title => response["short_title"]
		:congress_url => response["urls"]["congress"]
		:govtrack_url => response["urls"]["govtrack"]
		:opencongress_url => response["urls"]["opencongress"]
		:active => response["history"]["active"]
		:active_at => response["history"]["active_at"]
		:awaiting_signature => response["history"]["awaiting_signature"]
		:enacted => response["history"]["enacted"]
		:enacted_at => response["history"]["enacted_at"]
		:house_passage_result => response["history"]["house_passage_result"]
		:house_passage_result_at => response["history"]["house_passage_result_at"]
		:senate_passage_result => response["history"]["pass"]
		:senate_passage_result_at => response["history"]["senate_passage_result_at"]
		:vetoed => response["history"]["vetoed"]
		}
	end
end
