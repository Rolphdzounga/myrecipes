class CreateCommentaires < ActiveRecord::Migration[5.1]
  def change
    create_table :commentaires do |t|
      t.text :description
      t.belongs_to :chef, foreign_key: true
      t.belongs_to :recette, foreign_key: true

      t.timestamps
    end
  end
end
