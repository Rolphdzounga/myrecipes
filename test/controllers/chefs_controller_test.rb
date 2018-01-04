require "test_helper"

describe ChefsController do
  let(:chef) { chefs :one }

  it "gets index" do
    get chefs_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_chef_url
    value(response).must_be :success?
  end

  it "creates chef" do
    expect {
      post chefs_url, params: { chef: { chefname: chef.chefname, email: chef.email, password: chef.password, password_confirmation: chef.password_confirmation } }
    }.must_change "Chef.count"

    must_redirect_to chef_path(Chef.last)
  end

  it "shows chef" do
    get chef_url(chef)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_chef_url(chef)
    value(response).must_be :success?
  end

  it "updates chef" do
    patch chef_url(chef), params: { chef: { chefname: chef.chefname, email: chef.email, password: chef.password, password_confirmation: chef.password_confirmation } }
    must_redirect_to chef_path(chef)
  end

  it "destroys chef" do
    expect {
      delete chef_url(chef)
    }.must_change "Chef.count", -1

    must_redirect_to chefs_path
  end
end
