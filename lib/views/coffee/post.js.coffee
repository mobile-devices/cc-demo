# Post Message controller used by post.erb
# Messages docummentation: http://wordsabout.it/mobile-devices/cloudconnect-user-documentation/cc-0005-messages
App.postMessageFormView = Em.View.extend({
    tagName: 'form',
    # fields
    asset: '',
    channel: '',
    payload: '',
    # action on form submit
    submit: (e) ->
      # data from the form
      post_data = 'url=' + App.baseUrl('messages') + '&token=' + App.token() + '&recipient=' + this.get('asset') + '&asset=' + this.get('asset') + '&channel=' + this.get('channel') + '&b64_payload=' + this.get('payload')
      $.ajax({
        # POST request (see server.rb /message)
        url: '/message',
        type: 'POST',
        data: post_data,
        contentType: 'application/x-www-form-urlencoded',
        # display "Message sent!" on success
        success: (msg) ->
         alert("Message sent!");
        # display the "error status" on error
        error: (xhr, ajaxOptions, thrownError) ->
          alert(xhr.status);
          alert(thrownError);
      })
});
