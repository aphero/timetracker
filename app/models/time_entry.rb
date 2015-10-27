class TimeEntry < ActiveRecord::Base
  has_one :project
  belongs_to :developer
  
end
