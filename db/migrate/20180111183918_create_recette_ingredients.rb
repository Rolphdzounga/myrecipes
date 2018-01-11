class CreateRecetteIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recette_ingredients do |t|
      t.belongs_to :recette, foreign_key: true
      t.belongs_to :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
