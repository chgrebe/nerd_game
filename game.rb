class Game

  attr_reader :commands
  attr_accessor :parser
  attr_accessor :player
  attr_accessor :locations
  attr_accessor :current_location
  attr_accessor :last_location
  attr_accessor :game_not_finished
  def initialize(name, locations, starting_location)
    @player = Player.new(name)
    @locations = locations
    @current_location = starting_location
    @last_location = starting_location
    @game_not_finished = true
    @commands = get_all_commands
    @parser = Factory.create_parser

  end

  def start
    #
    # TODO:intro

    while (@game_not_finished)

      input = get_next_input_words
      command = @parser.parse_input_to_command(input)
      puts "******** Before Command Execution ********"
      puts "Command to execute: #{command.inspect}"
      CommandHandler.execute(command)
    end
  end

  def get_next_input_words
    print "What do you want to do? :> "
    gets.scan(/[a-zA-Z]+/)
  end
  
  def back
    @current_location.back
  end
  
  def combine(object_1, object_2)
    object_1.send("combine", object_2)
  end
  
  def dress(item)
    
  end
  
  def drop(item)
    if @player.inventory.has_item?(item)
      @player.inventory.remove_item(item)
      @current_location.add_item(item)
    else
      puts "You don't have #{item.name} in your inventory."
    end
  end
  
  def exits
    @current_location.print_exits
  end
  
  def go(location)
    @current_location.go_to(location)
  end
  
  def help
     puts "Commands: #{@commands.join(", ")}."
  end
  
  def info
    #show player stats and inventory
    puts "#{@player.name}'s inventory: "
    inventory_items = @player.inventory.get_items
    
    if inventory_items.length > 0
      inventory_items.each do |item|
        puts "debug:game:item im inventar: #{item.inspect}"
        puts "\t#{item.get_name}"
      end
    else
      puts "As hard as you try to find something, it's empty!"
    end
  end
  
  def inventory
    
  end
  
  def items
    @current_location.print_items
  end
  
  def look
    @current_location.look
  end
  
  def npcs
    @current_location.print_npcs
  end
  
  def push(object)
    object.push
  end
  
  def quit
     puts "Game terminated. :("
     Process.exit
  end
  
  def talk(object)
    object.talk
  end
  
  def take(item)
    if @current_location.has_item?(item)
      @current_location.remove_item(item)
      @player.inventory.add_item(item)
    else
      puts "There is no #{item.name} in #{@current_location.name}."
    end
  end
  
  def undress(item)
    
  end
  
  def use(item)
    
  end
 

  
  def get_all_commands # unfortunately still hard-coded
    ["back", "combine", "dress", "drop", "exits", "go", "help", "info", "inventory", "items",
     "look", "npcs", "push", "quit", "talk", "take", "undress", "use"]
  end
  
  def get_object_by_name(name)
    
    get_inventory.each do |item|
      if name == item.name
        return item
      end
    end
    
    @locations.each do |location|
      location.get_items.each do |item|
        if name == item.name.downcase
          return item
        end
      end
      
      location.get_npcs.each do |npc|
        if name == npc.name.downcase
          return npc
        end
      end
      
      if name == location.name.downcase
        return location
      end
      
    end
    nil
  end

  def get_current_npcs
    @current_location.get_npcs
  end
  
  def get_current_items
    @current_location.get_items
  end
  
  def get_inventory
    @player.inventory.get_items
  end
  
end