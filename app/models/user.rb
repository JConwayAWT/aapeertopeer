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

  def incoming_tutor_id
    return self.id
  end

  def display_name
    self.first_name + " " + self.last_name
  end
  
end
