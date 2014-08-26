class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :providing_enrollments
  has_many :consuming_enrollments

  has_many :subjects_teaching, :through => :providing_enrollments, :source => :subject
  has_many :subjects_learning, :through => :consuming_enrollments, :source => :subject

  has_many :tutor_applications, dependent: :destroy
  has_many :requests, dependent: :destroy

  def incoming_tutor_id
    return self.id
  end

  def display_name
    self.first_name + " " + self.last_name
  end

  def total_tutoring_hours
    requests = Request.where(tutor_id: self.id)
    
    if requests.count == 0
      return 0
    end

    completed_requests = []
    total_hours = 0
    requests.each do |r|
      if r.status == "Accepted" and r.session_review.date != nil
        total_hours += r.duration
      end
    end

    return total_hours
  end
  
end
