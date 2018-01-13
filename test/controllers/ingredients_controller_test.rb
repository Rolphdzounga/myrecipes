require "test_helper"

describe IngredientsController do
  let(:ingredient) { ingredients :one }

  it "gets index" do
    get ingredients_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_ingredient_url
    value(response).must_be :success?
  end

  it "creates ingredient" do
    expect {
      post ingredients_url, params: { ingredient: { name: ingredient.name } }
    }.must_change "Ingredient.count"

    must_redirect_to ingredient_path(Ingredient.last)
  end

  it "shows ingredient" do
    get ingredient_url(ingredient)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_ingredient_url(ingredient)
    value(response).must_be :success?
  end

  it "updates ingredient" do
    patch ingredient_url(ingredient), params: { ingredient: { name: ingredient.name } }
    must_redirect_to ingredient_path(ingredient)
  end

  it "destroys ingredient" do
    expect {
      delete ingredient_url(ingredient)
    }.must_change "Ingredient.count", -1

    must_redirect_to ingredients_path
  end
end
