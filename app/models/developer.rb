class Developer < ActiveRecord::Base
  has_many :time_entries

  attr_reader :developer
end
