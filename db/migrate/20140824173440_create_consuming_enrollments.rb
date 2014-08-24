class CreateConsumingEnrollments < ActiveRecord::Migration
  def change
    create_table :consuming_enrollments do |t|
      t.belongs_to :user
      t.belongs_to :subject
      t.timestamps
    end
  end
end
