# frozen_string_literal: true

class AddedNotUniqueConstraintToUsres < ActiveRecord::Migration
  def change
    remove_index :users, :email
    add_index :users, :email
  end
end
