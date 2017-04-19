class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.string :name, null: false, unique: true
      t.string :url, null: false
      t.text :local_path

      t.timestamps
    end
  end
end
