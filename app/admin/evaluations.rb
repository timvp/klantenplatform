ActiveAdmin.register Evaluation do

	menu :parent => 'Trainings'

	index do
	  #id_column
	  column :contact
	  column :training
	  column :created_at
	  default_actions
	end

	show do
		#attributes_table :contact, :training, lambda{evaluation.evaluation_doc.url}
		
		attributes_table_for evaluation do
		  row :contact
		  row("Training") { auto_link evaluation.training }
		  row("Document") { link_to evaluation.evaluation_doc_file_name, evaluation.evaluation_doc.url }
		end
		
		active_admin_comments
		
	end

  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do
      f.input :contact
      f.input :training
      f.input :evaluation_doc_file_name, :disabled => true
      f.input :evaluation_doc, :as => :file
    end
    f.buttons
   end
   
end
