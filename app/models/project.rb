class Project < ActiveRecord::Base
  has_many :time_entries

  attr_reader :project
end
