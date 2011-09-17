class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :contact_id
      t.integer :training_id
      t.string  :evaluation_type
      t.timestamps
    end
  end
end
