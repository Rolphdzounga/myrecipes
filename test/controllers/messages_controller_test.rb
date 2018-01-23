require "test_helper"

describe MessagesController do
  let(:message) { messages :one }

  it "gets index" do
    get messages_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_message_url
    value(response).must_be :success?
  end

  it "creates message" do
    expect {
      post messages_url, params: { message: { content: message.content } }
    }.must_change "Message.count"

    must_redirect_to message_path(Message.last)
  end

  it "shows message" do
    get message_url(message)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_message_url(message)
    value(response).must_be :success?
  end

  it "updates message" do
    patch message_url(message), params: { message: { content: message.content } }
    must_redirect_to message_path(message)
  end

  it "destroys message" do
    expect {
      delete message_url(message)
    }.must_change "Message.count", -1

    must_redirect_to messages_path
  end
end
