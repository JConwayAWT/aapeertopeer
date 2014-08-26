class AddReferencesToReviews < ActiveRecord::Migration
  def change
    change_table :session_reviews do |t|
      t.belongs_to :tutor
      t.belongs_to :learner
      t.belongs_to :subject
      t.belongs_to :request
    end
  end
end
