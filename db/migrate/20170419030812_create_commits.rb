class CreateCommits < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
      t.string :reference, null: false, unique: true
      t.string :title
      t.string :file_statistics
      t.datetime :author_datetime
      t.references :repository, foreign_key: true, null: false

      t.timestamps
    end
  end
end
