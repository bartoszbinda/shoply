# frozen_string_literal: true

class AddCurrentUserToGrup < ActiveRecord::Migration[5.0]
  def change
    change_table :groups do |t|
      t.string :created_by
    end
  end
end
