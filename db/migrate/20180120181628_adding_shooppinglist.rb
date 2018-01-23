# frozen_string_literal: true

class AddingShooppinglist < ActiveRecord::Migration[5.0]
  def change
    change_table :shopping_lists do |t|
      t.belongs_to :group, index: true
    end
  end
end
