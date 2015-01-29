class Chat
  messages: {}

  addMessage: (msg) ->
    if @messages[msg.id]
      console.log "#{msg.note} is already there"
    else
      @messages[msg.id] = msg
      @showMessage(msg)
      console.log "#{msg.note} has been added"

  handleSocketResponse: (msg) ->
    @addMessage(msg)

  showMessage: (message) ->
    template = $('#message_template').html();
    Mustache.parse(template);
    rendered = Mustache.render(template, {message: message});
    $('#messages').prepend(rendered)

  showMessages: ->
    @showMessage(message) for message_id, message of @messages      

@chat = new Chat

$ ->
  chat.showMessages()