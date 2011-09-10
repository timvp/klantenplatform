class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :contact_id
      t.integer :training_id

      t.timestamps
    end
  end
end
