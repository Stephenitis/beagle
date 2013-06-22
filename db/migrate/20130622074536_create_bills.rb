class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string   :bill_id
      t.string   :bill_type
      t.integer  :number
      t.string   :congress
      t.string   :short_title
      t.string   :nicknames
      t.datetime :introduced_on
      t.datetime :last_action_at
      t.datetime :last_vote_at
      t.string   :official_title
      t.string   :popular_title
      t.string   :congress_url
      t.string   :govtrack_url
      t.string   :opencongress_url
      t.boolean  :active
      t.datetime :active_at
      t.boolean  :awaiting_signature
      t.boolean  :enacted
      t.datetime :enacted_at
      t.string   :house_passage_result
      t.datetime :house_passage_result_at
      t.string   :senate_passage_result
      t.datetime :senate_passage_result_at
      t.boolean  :vetoed
    end
  end
end
