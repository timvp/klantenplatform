ActiveAdmin.register Contact do


  index do
    #id_column
    column :firstname #{|contact| link_to contact.firstname, admin_contact_path(contact)}
    column "Voornaam", 
           lambda{|contact| link_to contact.firstname, admin_contact_path(contact)}, 
           :sortable => :firstname
    column :name
    column :created_at
    column :updated_at
    default_actions
  end
  
  
  show :title => :full_name do
    
    attributes_table :firstname, :name,  :created_at, :updated_at
         
    panel "Evaluations" do
      table_for(contact.evaluations) do
        column "Naam", lambda{|evaluation| evaluation.contact.full_name }
        column("Evaluated", :sortable => :created_at) {|evaluation| pretty_format(evaluation.created_at)}
        column("Action") {|evaluation| link_to "View", admin_evaluation_path(evaluation), :method => :get, :popup => true }
      end
    end
               
    active_admin_comments
    
  end
  
end
