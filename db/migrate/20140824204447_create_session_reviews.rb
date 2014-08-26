class CreateSessionReviews < ActiveRecord::Migration
  def change
    create_table :session_reviews do |t|
      t.date :date
      t.integer :knows_and_understands
      t.integer :explains_clearly
      t.integer :asks_me_questions
      t.integer :listens_and_understands
      t.integer :checks_my_understanding
      t.integer :is_patient
      t.integer :is_friendly
      t.integer :alternative_explanations
      t.integer :accomodates
      t.integer :uses_aids
      t.integer :on_time
      t.integer :overall_helpful
      t.text :additional_comments

      t.timestamps
    end
  end
end
