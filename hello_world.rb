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

get '/character/:id' do
  # for now, we can just store the characters in a hash (aka dictionary), and access them by thier key
  characters = {
      calvin: Character.new("Calvin", "I think night time is dark so you can imagine your fears with less distraction."),
      hobbes: Character.new("Hobbes", "Van Gogh would’ve sold more than one painting if he’d put tigers in them."),
  }

  id = params[:id].to_sym # grab the id from the request parameters and turn it into a symbol (because the keys in our hash are symbols, we'll talk about this)
  @character = characters[id] # This is how to access a value based on it's key (an id of 1 gives us Caliven, 2 gives us hobbes)

  erb :character
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
