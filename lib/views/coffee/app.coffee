window.App = App = Em.Application.create({
  account:  'Demo',
  token:    'demotoken',
  baseUrl:  (path) ->
    self = this
    # "http://" + this.account + ".integration.cloudconnect.io/api/v3/" + path + '.jsonp?_token=' + this.token
    "http://" + this.account + ".apiv3.dev/api/v3/" + path + '.jsonp?_token=' + this.token
})

App.MyView = Em.View.extend
  mouseDown: ->
    window.alert("hello world!")

App.Asset = Em.Object.extend({
  description: null,
  imei: null,
  name: null,
  serial: null
})

App.assetsController = Em.ArrayController.create({
  content: [],
  loadAssets: ->
    self = this
    $.ajax({
      url:  App.baseUrl('assets'),
      dataType: 'jsonp',
      data: "q=asset:355131040628343",
      success: (data) ->
        data.forEach( (item) ->
          console.log(item)
          self.pushObject(App.Asset.create(item))
        )
    })
})
