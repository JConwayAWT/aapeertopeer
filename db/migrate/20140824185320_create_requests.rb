class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :time #like start time...
      t.string :status
      t.text :rejection_message
      t.text :additional_information
      t.decimal :duration

      t.timestamps
    end
  end
end
