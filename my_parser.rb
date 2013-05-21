#combine, drop, go, look, push, talk, take, use, wear
#back, commands, exits, help, info, quit
require "my_command.rb"

class MyParser
  #
  attr_reader :input
  attr_reader :command_word
  attr_reader :command_object_1
  attr_reader :command_object_2
  attr_reader :object_names
  #
  def parse_input_to_command(input)
    @input = nil
    @command_word = nil
    @command_object_1 = nil
    @command_object_2 = nil
    @object_names = nil
    
    if (input == [])
      Factory.create_false_command
    else
      @input = input.uniq # set_input(input)
      set_command_word
      set_command_objects
      create_command
    end
  end
  
  def create_command
    if @command_word
      Factory.create_command(@command_word, @command_object_1, @command_object_2)
    else
      Factory.create_false_command
    end
  end
  
  def set_input(input)
    puts "my_parser unformatted input: #{input}"
    @input = input
        
    delete_unneeded_input!
    puts "@input after removing unnecessary words: #{@input}"
    @input.uniq.each do |word| @input << word.downcase end
    puts "@input after removing double words: #{@input}"
  end

  def set_command_word
    if @input.length > 0
      puts "@input before set_command_word: #{@input}"
      puts "@command_word: #{@command_word}"
      @input.each do |word|
        if $game.commands.include?(word)
          @input.delete(word)
          @command_word = word if @command_word == nil
          puts "@input after set_command_word: #{@input}"
          puts "@command_word: #{@command_word}"
        end
      end
    end
  end
  
  def delete_unneeded_input!
    unneeded_words = ["the", "a", "with", "in", "on", "about", "without"]
    @input.each do |word|
      if unneeded_words.include?(word)
        @input.delete(word)
      end
    end
  end


##HERE TO GO ON
  def set_command_objects
    puts "@input before set_command_object: #{@input}"
    command_objects = []
    
    @input.each do |name|
      if command_objects.length < 1 || @command_word == "combine" && command_objects.length < 2
        if name_is_valid_object_name?(name)
          command_objects << $game.get_object_by_name(name)
          
        end
      end
    end 

            
    @command_object_1, @command_object_2 = command_objects
    puts "@input after set_command_object: #{@input}"
    puts "@object_1 and @object_2: #{@command_object_1.to_s + ", " + @command_object_2.to_s}."
  end
  
  def name_is_valid_object_name?(name)
    if object = $game.get_object_by_name(name)
      puts "object for validity check: #{object.inspect}"
      
      $game.get_current_npcs.each do |npc|
        if object== npc
          puts "NPC detected true."
          return true
        end
      end
      
      $game.get_current_items.each do |item|
        if object == item
          puts "Item detected true."
          return true
        end
      end
      
      $game.get_inventory.each do |item|
        if object == item
          puts "debug:game:inventory item detected"
          return true
        end
      end
      
      if $game.current_location.get_exits.include?(object)
        return true
      end
      
      if $game.current_location == object
        return true
      end
    end
    false
  end

end
