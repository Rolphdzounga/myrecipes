require "test_helper"

describe RecetteIngredient do
  let(:recette_ingredient) { RecetteIngredient.new }

  it "must be valid" do
    value(recette_ingredient).must_be :valid?
  end
end
