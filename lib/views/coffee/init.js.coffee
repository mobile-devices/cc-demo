# create the application
# use the "account" and "token" provided by MDI to connect to your CloudConnect account
window.App = App = Em.Application.create({
  account:  'Demo',
  token:    'demotoken',
  getToken:  () ->
    self.token
  baseUrl:  (path) ->
    self = this
    "http://" + this.account + ".integration.cloudconnect.io/api/v3/" + path + '.jsonp?_token=' + this.token
});

App.MyView = Em.View.extend({
  mouseDown: ->
    window.alert "Alert!"
});
