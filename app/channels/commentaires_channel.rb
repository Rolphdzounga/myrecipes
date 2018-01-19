class CommentairesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "commentaires"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
