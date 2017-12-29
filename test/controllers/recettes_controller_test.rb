require "test_helper"

describe RecettesController do
  let(:recette) { recettes :one }

  it "gets index" do
    get recettes_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_recette_url
    value(response).must_be :success?
  end

  it "creates recette" do
    expect {
      post recettes_url, params: { recette: { description: recette.description, name: recette.name } }
    }.must_change "Recette.count"

    must_redirect_to recette_path(Recette.last)
  end

  it "shows recette" do
    get recette_url(recette)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_recette_url(recette)
    value(response).must_be :success?
  end

  it "updates recette" do
    patch recette_url(recette), params: { recette: { description: recette.description, name: recette.name } }
    must_redirect_to recette_path(recette)
  end

  it "destroys recette" do
    expect {
      delete recette_url(recette)
    }.must_change "Recette.count", -1

    must_redirect_to recettes_path
  end
end
