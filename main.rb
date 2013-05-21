#require File.expand_path(File.dirname(__FILE__) + '/player.rb')
$: << File.dirname(__FILE__) << File.dirname(__FILE__) + "/lib"
$: << File.dirname(__FILE__) + "/interactable_objects"

# puts $:

Dir[File.dirname(__FILE__) + '/locations/*.rb'].each {|file| require file }
require "game.rb"
require "player.rb"
require "factory.rb"
require "interactable_objects/interactable_object.rb"
require "my_parser.rb"
require "my_command.rb"
require "command_handler.rb"


# ************************************************************

def create_locations
  
end

def add_and_create_npcs!(locations)
  
end

def add_and_create_items!(locations)
  
end

# ************************************************************

locations = Factory.create_and_get_test_locations # create_locations
puts "here"
add_and_create_npcs!(locations)
add_and_create_items!(locations)
starting_location = locations.first
 
$game = Game.new("Christian", locations, starting_location)
$game.start
