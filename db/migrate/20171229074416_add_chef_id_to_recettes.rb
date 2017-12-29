class AddChefIdToRecettes < ActiveRecord::Migration[5.1]
  def change
    add_column :recettes, :chef_id, :integer
  end
end
