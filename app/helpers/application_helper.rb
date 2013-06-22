module ApplicationHelper
	def official_title_handler(title)
		if title.length > 70
  	 	"#{title[0..70]}..."
  	else
  		"#{title}"
  	end
	end

	def short_title_handler(bill_hash)
		if bill_hash["short_title"].nil?
	  	"No bill short title available. (#{bill_hash['bill_id']})"
	  else
	  	"#{bill_hash['short_title']} (#{bill_hash['bill_id']})"
	  end
	end
end
