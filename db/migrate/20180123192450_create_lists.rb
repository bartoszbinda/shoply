class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.text :body
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
