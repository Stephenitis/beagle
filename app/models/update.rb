class Update < ActiveRecord::Base
  attr_accessible :details, :datetime
  belongs_to :bill
end
