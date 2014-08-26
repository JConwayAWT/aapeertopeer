class AddAttachmentTranscriptToTutorApplications < ActiveRecord::Migration
  def self.up
    change_table :tutor_applications do |t|
      t.attachment :transcript
      t.attachment :letters_of_recommendation
    end
  end

  def self.down
    remove_attachment :tutor_applications, :transcript
    remove_attachment :tutor_applications, :letters_of_recommendation
  end
end
