#require "rubygems"
#require "bundler/setup"
require 'sinatra/base'
require 'coffee-script'
require 'execjs'

class Server < Sinatra::Base
  get '/' do
    @url = "http://XXXXXX"
    erb :index
  end

  get '/coffee/app.js' do
    coffee :'coffee/app'
  end

  # Usage: partial :foo
  helpers do
    def partial(page, options={})
      erb page, options.merge!(:layout => false)
    end
  end
end
