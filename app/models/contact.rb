class Contact < ActiveRecord::Base
  has_paper_trail
  has_many :trainings, :through => :registrations
end
