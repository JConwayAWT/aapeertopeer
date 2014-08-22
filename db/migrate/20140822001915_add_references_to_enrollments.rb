class AddReferencesToEnrollments < ActiveRecord::Migration
  def change
    change_table :enrollments do |t|
      t.belongs_to :user
      t.belongs_to :subject
    end
  end
end
