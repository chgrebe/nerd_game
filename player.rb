require "inventory.rb"
require "player_attributes.rb"

class Player
  
  attr_accessor :name
  attr_accessor :charisma
  attr_accessor :inventory
  attr_accessor :attributes
  
  def initialize(name)
    @name = name
    @inventory = Inventory.new
    @attributes = PlayerAttributes.new
  end
  
end