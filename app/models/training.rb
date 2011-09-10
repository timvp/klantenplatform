class Training < ActiveRecord::Base
	has_many :contacts, :through => :registrations
end
