# frozen_string_literal: true

class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :lists
  accepts_nested_attributes_for :lists
  cattr_accessor :current_user
end
