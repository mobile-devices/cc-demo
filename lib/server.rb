#require "rubygems"
#require "bundler/setup"
require 'sinatra/base'
require 'coffee-script'
require 'execjs'

require 'sprockets'

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

  # Usage: partial :foo
  helpers do
    def partial(page, options={})
      erb page, options.merge!(:layout => false)
    end
  end
end
