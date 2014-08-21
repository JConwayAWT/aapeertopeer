class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :is_admin
      t.boolean :is_tutor
      t.boolean :is_student
      t.string :skype_id
      t.string :times_available
      t.string :additional_information

      t.timestamps
    end
  end
end
