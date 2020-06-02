require 'sinatra'
require 'sinatra/reloader'
require 'byebug'

get '/' do
  erb :index
end


get '/character/:id' do
  # for now, we can just store the characters in a hash (aka dictionary), and access them by their key
  characters = {
      calvin: Character.new("Calvin"),
      hobbes: Character.new("Hobbes"),
      hiccup: Character.new("Hiccup Horrendous Haddock III"),
      reynie: Character.new("Reynie Muldoon"),
      penelope: Character.new("Penelope Lumley"),
      simon: Character.new("Simon Harley-Dickinson")
  }

  id = params[:id].to_sym # grab the id from the request parameters and turn it into a symbol (because the keys in our hash are symbols, we'll talk about this)
  @character = characters[id] # This is how to access a value based on it's key (an id of 1 gives us Calvin, 2 gives us Hobbes)

  # CALVIN ATTRIBUTES
  characters['calvin'.to_sym].series("Calvin and Hobbes")
  characters['calvin'.to_sym].quote("I think night time is dark so you can imagine your fears with less distraction.")
  characters['calvin'.to_sym].text_color("008000") #green

  # HOBBES ATTRIBUTES
  characters['hobbes'.to_sym].series("Calvin and Hobbes")
  characters['hobbes'.to_sym].quote("Van Gogh would’ve sold more than one painting if he’d put tigers in them.")
  characters['hobbes'.to_sym].image_source("hobbes.jpg")
  characters['hobbes'.to_sym].text_color("FC6A03") #tiger orange

  # HICCUP ATTRIBUTES
  characters['hiccup'.to_sym].series("How to Train Your Dragon")
  characters['hiccup'.to_sym].quote("I have about as much charisma as a stranded jellyfish...")
  characters['hiccup'.to_sym].personal_traits("Clever & intelligent & kind")
  characters['hiccup'.to_sym].cool_skills("Swordfighting & speaking Dragonese & making Very Clever Plans")
  characters['hiccup'.to_sym].text_color("055A8C") #ocean blue

  # REYNIE ATTRIBUTES
  characters['reynie'.to_sym].series("The Mysterious Benedict Society")
  characters['reynie'.to_sym].personal_traits("Intelligent & honest & kind")
  characters['reynie'.to_sym].cool_skills("Solving riddles and puzzles & leading his friends")
  characters['reynie'.to_sym].text_color("072F5F") #navy blue

  # PENELOPE ATTRIBUTES
  characters['penelope'.to_sym].series("The Incorrigible Children of Ashton Place")
  characters['penelope'.to_sym].quote("Feeling one ought to apologize is not quite the same as saying \'I am sorry\'")
  characters['penelope'.to_sym].personal_traits("Clever & pithy & caring")
  characters['penelope'.to_sym].cool_skills("Dancing the schottische & being a governess to wolf children")
  characters['penelope'.to_sym].text_color("0E6B0E") #foresty green

  # SIMON ATTRIBUTES
  characters['simon'.to_sym].series("The Incorrigible Children of Ashton Place")
  characters['simon'.to_sym].personal_traits("Kind & helpful & smart")
  characters['simon'.to_sym].cool_skills("Being a pirate & writing plays")
  characters['simon'.to_sym].text_color("2C1567") #darkish purple
  erb :character
end

class Character
  # attr_accessor saves you from getter and setter methods! https://www.rubyguides.com/2018/11/attr_accessor/
  attr_accessor :name, :favorite_quote, :books, :traits, :skills, :image, :color

  # https://www.rubyguides.com/2019/01/ruby-initialize-method/
  def initialize(name)
    # we need to convert the variables from local to instance
    @name = name
  end

  def quote(favorite_quote)
    @favorite_quote = favorite_quote
  end

  def series(series_title)
    @books = series_title
  end

  def personal_traits(traits)
    @traits = traits
  end

  def cool_skills(skills)
    @skills = skills
  end

  def image_source(image)
    @image = image
  end

  def text_color(color)
    @color = color
  end


end
