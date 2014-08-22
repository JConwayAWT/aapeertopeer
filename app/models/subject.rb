class Subject < ActiveRecord::Base

  has_many :enrollments
  has_many :people_teaching, :through => :enrollments, :source => :user
  has_many :people_learning, :through => :enrollments, :source => :user

end
