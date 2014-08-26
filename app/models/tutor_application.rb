class TutorApplication < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :transcript, 
      path: "transcripts/:id/:filename"

  do_not_validate_attachment_file_type :transcript

  has_attached_file :letters_of_recommendation, 
      path: "recommendations/:id/:filename"

  do_not_validate_attachment_file_type :letters_of_recommendation


end

require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end
