# definition of an element in the assets array controller
App.Asset = Em.Object.extend({
  description: null,
  imei: null,
  name: null,
  serial: null
});

# definition of the button
App.assetsViewController = Em.View.extend({
  buttonName: 'Loads Assets', 
});

# assets controller used by assets.erb
# Assets docummentation: wordsabout.it/mobile-devices/cloudconnect-user-documentation/cc-0003-assets
App.assetsController = Em.ArrayController.create({
  # content of the array
  content: [],
  # loadAssets action is binded to the button
  loadAssets: ->
    self = this
    # ajax request to ask Apiv3
    $.ajax({
      # GET request (see documentation)
      url:  App.baseUrl('assets'),
      dataType: 'jsonp',
      # QUERY STRING of the request (see documentation)
      data: "",
      # fill the assets array on success
      success: (data) ->
        data.forEach( (item) ->
          self.pushObject(App.Asset.create(item))
        )
    })
});
