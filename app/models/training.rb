class Training < ActiveRecord::Base

	has_many :contacts, :through => :registrations
	has_many :registrations
	has_many :evaluations
	
	validates :ends_at, :date => {:after => :starts_at, :message => 'Einddatum moet na startdatum' }

end
