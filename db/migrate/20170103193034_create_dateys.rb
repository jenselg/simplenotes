class CreateDateys < ActiveRecord::Migration[5.0]
  def change
    create_table :dateys do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
