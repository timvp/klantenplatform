ActiveAdmin.register Training do

	scope :ongoing do |trainings|
	  trainings.where("ends_at >= ?", Date.today)
	end
	
	scope :finished do |trainings|
	  trainings.where("ends_at < ?", Date.today)
	end

  show :title => :name do
    
    attributes_table :name, :starts_at, :ends_at
      
    panel "Registrations" do
      table_for(training.registrations) do
        column("Naam") {|registration| registration.contact.firstname + " " + registration.contact.name }
        column("Registration") {|registration| pretty_format(registration.created_at)}
         column("Action") {|registration| link_to "View", admin_registration_path(registration), :method => :get }
      end
    end
        
    active_admin_comments
  end

end
