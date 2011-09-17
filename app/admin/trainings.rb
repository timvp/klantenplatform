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
        column("Naam") {|registration| registration.contact.full_name }
        column("Registration") {|registration| pretty_format(registration.created_at)}
         column("Action") {|registration| link_to "View", admin_registration_path(registration), :method => :get }
      end
    end
    
    panel "Evaluations" do
      table_for(training.evaluations) do
        column("Naam") {|evaluation| evaluation.contact.full_name }
        column("Evaluated") {|evaluation| pretty_format(evaluation.created_at)}
        column("Action") {|evaluation| link_to "View", admin_evaluation_path(evaluation), :method => :get }
      end
    end
        
        
    active_admin_comments
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :starts_at, :label => "Start Date", :as => :datepicker
      f.input :ends_at, :label => "End Date", :as => :datepicker
    end
    f.buttons
  end

end
