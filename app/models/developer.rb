class Developer < ActiveRecord::Base
  has_many :time_entries
  has_secure_password

  attr_reader :developer
end
