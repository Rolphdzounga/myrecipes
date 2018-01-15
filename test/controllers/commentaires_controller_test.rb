require "test_helper"

describe CommentairesController do
  let(:commentaire) { commentaires :one }

  it "gets index" do
    get commentaires_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_commentaire_url
    value(response).must_be :success?
  end

  it "creates commentaire" do
    expect {
      post commentaires_url, params: { commentaire: { chef_id: commentaire.chef_id, description: commentaire.description, recette_id: commentaire.recette_id } }
    }.must_change "Commentaire.count"

    must_redirect_to commentaire_path(Commentaire.last)
  end

  it "shows commentaire" do
    get commentaire_url(commentaire)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_commentaire_url(commentaire)
    value(response).must_be :success?
  end

  it "updates commentaire" do
    patch commentaire_url(commentaire), params: { commentaire: { chef_id: commentaire.chef_id, description: commentaire.description, recette_id: commentaire.recette_id } }
    must_redirect_to commentaire_path(commentaire)
  end

  it "destroys commentaire" do
    expect {
      delete commentaire_url(commentaire)
    }.must_change "Commentaire.count", -1

    must_redirect_to commentaires_path
  end
end
