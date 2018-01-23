# frozen_string_literal: true

class ShoppingList < ActiveRecord::Base
  belongs_to :group
end
