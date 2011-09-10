class Registration < ActiveRecord::Base
	belongs_to :training
	belongs_to :contact
end
