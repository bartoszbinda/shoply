# frozen_string_literal: true

class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_one :shopping_list
  cattr_accessor :current_user
end
