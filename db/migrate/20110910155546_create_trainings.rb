class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
