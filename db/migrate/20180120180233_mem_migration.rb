# frozen_string_literal: true

class MemMigration < ActiveRecord::Migration[5.0]
  def change
    change_table :memberships do |t|
      t.integer :user_id
      t.integer :group_id
    end
  end
end
