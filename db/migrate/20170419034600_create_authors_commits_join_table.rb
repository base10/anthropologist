class CreateAuthorsCommitsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :authors_commits, id: false do |t|
      t.references :author, foreign_key: true, null: false
      t.references :commit, foreign_key: true, null: false
    end
  end
end
