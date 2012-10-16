# Post Message controller used by post.erb
# Messages docummentation: http://wordsabout.it/mobile-devices/cloudconnect-user-documentation/cc-0005-messages
App.postMessageFormView = Em.View.extend({
    tagName: 'form',
    # fields
    recipient: '',
    channel: '',
    payload: '',
    # action on form submit
    submit: (e) ->
      # data from the form
      post_data = 'recipient=' + this.get('recipient') + '&channel=' + this.get('channel') + '&b64_payload=' + this.get('payload')
      $.ajax({
        # POST request (see documentation)
        url: App.baseUrl('messages'),
        type: 'POST',
        data: post_data,
        dataType: 'jsonp',
        # display "Message sended!" on success
        success: (msg) ->
         alert("Message sended!");
        # display the "error status" on error
        error: (xhr, ajaxOptions, thrownError) ->
          alert(xhr.status);
          alert(thrownError);
      })
});
