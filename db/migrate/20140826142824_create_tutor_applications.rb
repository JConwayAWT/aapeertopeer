class CreateTutorApplications < ActiveRecord::Migration
  def change
    create_table :tutor_applications do |t|
      t.string :full_name
      t.integer :grade
      t.string :email
      t.string :times_available
      t.string :subjects

      t.timestamps
    end
  end
end
