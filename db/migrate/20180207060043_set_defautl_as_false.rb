class SetDefautlAsFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :lists, :status, :boolean, default: false
  end
end
