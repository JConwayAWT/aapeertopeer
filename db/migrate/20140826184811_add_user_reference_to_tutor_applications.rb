class AddUserReferenceToTutorApplications < ActiveRecord::Migration
  def change
    change_table :tutor_applications do |t|
      t.belongs_to :user
    end
  end
end
