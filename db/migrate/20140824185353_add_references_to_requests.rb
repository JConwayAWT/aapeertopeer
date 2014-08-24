class AddReferencesToRequests < ActiveRecord::Migration
  def change
    change_table :requests do |t|
      t.belongs_to :subject
      t.belongs_to :learner
      t.belongs_to :tutor
    end
  end
end
