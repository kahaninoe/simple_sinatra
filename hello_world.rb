require 'sinatra'
require 'sinatra/reloader'
require 'byebug'

get '/' do
  'Hello world!'
end

get '/erb_example' do
  hi = "I'm a (local) variable that won't get passed to the view"
  @hi = "I'm a (instance) variable that will get passed to the view!"
  @message = "Welcome to COMPUTER SCIENCE WEBSITE"

  erb :index
end
