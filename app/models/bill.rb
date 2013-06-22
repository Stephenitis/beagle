class Bill < ActiveRecord::Base
  attr_accessible :bill_id, :bill_type, :number, :congress, :introduced_on, :last_action_at, :last_vote_at, :official_title, :popular_title, :short_title, :congress_url, :govtrack_url, :opencongress_url, :active, :active_at, :awaiting_signature, :enacted, :enacted_at, :house_passage_result, :house_passage_result_at, :senate_passage_result, :senate_passage_result_at, :vetoed, :nicknames
  has_many :updates
  def to_param
    bill_id
  end

end
