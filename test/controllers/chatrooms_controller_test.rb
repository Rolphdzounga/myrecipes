require "test_helper"

describe ChatroomsController do
  let(:chatroom) { chatrooms :one }

  it "gets index" do
    get chatrooms_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_chatroom_url
    value(response).must_be :success?
  end

  it "creates chatroom" do
    expect {
      post chatrooms_url, params: { chatroom: { show: chatroom.show } }
    }.must_change "Chatroom.count"

    must_redirect_to chatroom_path(Chatroom.last)
  end

  it "shows chatroom" do
    get chatroom_url(chatroom)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_chatroom_url(chatroom)
    value(response).must_be :success?
  end

  it "updates chatroom" do
    patch chatroom_url(chatroom), params: { chatroom: { show: chatroom.show } }
    must_redirect_to chatroom_path(chatroom)
  end

  it "destroys chatroom" do
    expect {
      delete chatroom_url(chatroom)
    }.must_change "Chatroom.count", -1

    must_redirect_to chatrooms_path
  end
end
