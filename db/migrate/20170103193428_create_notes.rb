class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.string :priority
      t.datetime :finished_at
      t.references :datey, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
