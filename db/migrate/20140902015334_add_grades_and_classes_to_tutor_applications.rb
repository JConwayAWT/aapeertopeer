class AddGradesAndClassesToTutorApplications < ActiveRecord::Migration
  def change
    change_table :tutor_applications do |t|
      t.text :classes_and_grades
    end
  end
end
