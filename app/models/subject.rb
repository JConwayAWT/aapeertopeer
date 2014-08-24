class Subject < ActiveRecord::Base

  has_many :providing_enrollments
  has_many :consuming_enrollments
  has_many :people_teaching, :through => :providing_enrollments, :source => :user
  has_many :people_learning, :through => :consuming_enrollments, :source => :user

  accepts_nested_attributes_for :people_teaching, allow_destroy: true
  attr_accessor :people_teachings_attributes

  attr_accessor :incoming_tutor_id

end
