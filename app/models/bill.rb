class Bill < ActiveRecord::Base
  attr_accessible :bill_id
  def to_param
    bill_id
  end
end
