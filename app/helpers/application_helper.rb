module ApplicationHelper

	def official_title_handler(title)
		if title.length > 70
			"#{title[0..70]}..."
		else
			"#{title}"
		end
	end

	def short_title_handler(bill_hash)
		if bill_hash["nicknames"].nil?
			if bill_hash["popular_title"].nil?
				if bill_hash["short_title"].nil?
					split_id = bill_hash['bill_id'].split('-')
					"#{split_id.first.titleize} in the #{split_id.last}th Congress."
				else
					"#{bill_hash['short_title']} (#{bill_hash['bill_id']})"
				end
			else
				"#{bill_hash['popular_title']} (#{bill_hash['bill_id']})"
			end
		else
			nicknames = bill_hash['nicknames']
			unless bill_hash['popular_title'].nil?
				nicknames.delete(bill_hash['popular_title'].downcase)
				title = bill_hash['popular_title']
				title = title.titleize unless title == title.upcase
				"#{title} (alt: #{nicknames.join(", ")}) (#{bill_hash['bill_id']})"
			else
				"#{nicknames.first.titleize} (alt: #{nicknames[1..-1].join(", ")}) (#{bill_hash['bill_id']})"
			end
		end
	end

end
