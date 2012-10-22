#require "rubygems"
#require "bundler/setup"
require 'sinatra/base'
require 'coffee-script'
require 'execjs'
require 'sprockets'
require 'json'
require 'net/http'
require 'uri'

class Server < Sinatra::Base
  get '/' do
    @url = "http://XXXXXX"
    erb :access
  end

  get '/coffee/app.js' do
    env = Sprockets::Environment.new
    env.append_path "lib/views/coffee"
    env["app.coffee"]
  end

  post '/message' do
    # extract data from the post ajax post request
    to_send, payload, connect = {}, {}, {}
    params.each do |key, value|
      if key != 'token' && key != 'url'
        payload[key] = value
      else
        connect[key] = value
      end
    end
    # struct of a post request (see documentation)
    to_send['message'] = payload
    uri = URI(connect['url'])
    path = uri.path.split('.')
    begin
      # post a new message to APIv3
      net = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(path[0])
      request.content_type = 'application/json'
      request.body = to_send.to_json
      request.basic_auth connect['token'], 'X'
      response = net.start do |http|
        http.request(request)
      end
    return to_send.to_json
    rescue SocketError => se
      "Got socket error: #{se}"
    end
  end

  # Usage: partial :foo
  helpers do
    def partial(page, options={})
      erb page, options.merge!(:layout => false)
    end
  end
end
