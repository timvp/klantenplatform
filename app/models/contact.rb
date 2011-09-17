class Contact < ActiveRecord::Base

  has_paper_trail
  has_many :trainings, :through => :registrations
  has_many :registrations
  has_many :evaluations
  
  def full_name
  	 [firstname, name].join(' ')
  end
  
end
