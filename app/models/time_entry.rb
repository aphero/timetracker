class TimeEntry < ActiveRecord::Base
  belongs_to :project
  belongs_to :developer

  attr_reader :time_entry

end
