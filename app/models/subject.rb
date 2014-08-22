class Subject < ActiveRecord::Base

  has_many :enrollments
  has_many :people_teaching, :through => :enrollments, :source => :user
  has_many :people_learning, :through => :enrollments, :source => :user

  accepts_nested_attributes_for :people_teaching, allow_destroy: true
  attr_accessor :people_teachings_attributes

  attr_accessor :incoming_tutor_id

end
