# frozen_string_literal: true

class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :lists
  accepts_nested_attributes_for :lists
  cattr_accessor :current_user
  validates_presence_of :name
  validates :name, length: { minimum: 5, maximum: 100}
  validates_presence_of :created_by

end
