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

class Character
  # attr_accessor saves you from getter and setter methods! https://www.rubyguides.com/2018/11/attr_accessor/
  attr_accessor :name, :favorite_quote

  # https://www.rubyguides.com/2019/01/ruby-initialize-method/
  def initialize(name, favorite_quote)
    # we need to convert the variables from local to instance
    @name = name
    @favorite_quote = favorite_quote
  end
end
