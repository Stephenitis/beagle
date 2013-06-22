class Bill < ActiveRecord::Base
  attr_accessible :bill_id
  has_many :updates
  def to_param
    bill_id
  end

end
