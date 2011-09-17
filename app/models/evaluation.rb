class Evaluation < ActiveRecord::Base
	belongs_to :contact
	belongs_to :training
	
	has_attached_file :evaluation_doc
end
