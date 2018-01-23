class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.references :chef, foreign_key: true
      t.references :recette, foreign_key: true

      t.timestamps
    end
  end
end
