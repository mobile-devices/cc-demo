# definition of an element in the messages array controller
App.Message = Em.Object.extend({
  channel: null,
  payload: null,
  thread_id: null,
  length: null,
  received_at: null
});

# definition of the button
App.messagesViewController = Em.View.extend({
  buttonName: 'Loads Messages',
});

# Messages controller used by messages.erb
# Messages docummentation: http://wordsabout.it/mobile-devices/cloudconnect-user-documentation/cc-0005-messages
App.messagesController = Em.ArrayController.create({
  # content of the array
  content: [],
  # loadMessages action is binded to the button
  loadMessages: ->
    self = this
    # ajax request to ask Apiv3
    $.ajax({
    # GET request (see documentation)
      url:  App.baseUrl('messages'),
      dataType: 'jsonp',
      data: "",
      # fill the messages array on success
      success: (data) ->
        data.forEach( (item) ->
          item["payload"] = Base64.decode64(item["b64_payload"]).substr 0, 140
          item["length"] = number_to_human_size(item["length"])
          item["received_at"] = display_date(item["received_at"])
          self.pushObject(App.Message.create(item))
        )
    })
});
