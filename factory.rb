Dir[File.dirname(__FILE__) + '/interactable_objects/locations/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/interactable_objects/items/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/interactable_objects/npcs/*.rb'].each {|file| require file }
require "my_parser.rb"
require "my_command.rb"


class Factory
  
  def Factory.create_locations_with_interactable_objects
    create_interactable_objects
    create_locations  
  end
  
  def Factory.create_command(command_word, object_1 = nil, object_2 = nil)
    MyCommand.new(command_word, object_1, object_2)
  end
  
  def Factory.create_false_command
    MyCommand.new
  end
  
  def Factory.create_and_get_test_item_handkerchief
    TestItemHandkerchief.new
  end
  
  def Factory.create_and_get_test_item_towel
    TestItemTowel.new
  end
  
  def Factory.create_test_npc_1
    TestNPC1.new
  end
  
  def Factory.create_test_npc_2
    TestNPC2.new
  end
  
  def Factory.create_parser
    MyParser.new
  end
  
  def Factory.create_and_get_test_locations
    loc1 = TestLocationOne.new
    loc2 = TestLocationTwo.new
    loc1.exits = [loc2]
    loc2.exits = [loc1]
    [loc1, loc2]
  end
  
end