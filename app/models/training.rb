class Training < ActiveRecord::Base
	has_many :contacts, :through => :registrations
	has_many :registrations
end
