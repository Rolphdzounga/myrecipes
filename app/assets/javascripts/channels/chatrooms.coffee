App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    #alert data['chef']
    $('#messages').append data['message']
    $('#message_content').val ''
    scrollToBottom()
    return

#jQuery(document).on 'turbolinks:load', ->
#    scrollToBottom()
#    return
    