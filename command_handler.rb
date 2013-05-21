class CommandHandler

  def self.execute(command)
    
    case command.method_name
      
      when "back"
        $game.send(command.method_name)
        
        
      when "combine"
        if command.nb_of_arguments == 2
          $game.send(command.method_name, command.object_1, command.object_2)
        else
          puts "You need at least two objects to combine something."
        end
        
        
      when "dress"
        if command.nb_of_arguments > 0
          $game.send(command.method_name, command.object_1)
        else
          puts "What do you want to dress?"
        end
        
        
      when "drop"
        if command.nb_of_arguments > 0
          $game.send(command.method_name, command.object_1)
        else
          puts "What do you want to drop?"
        end
        
       
      when "exits"
        $game.send(command.method_name)
         
         
      when "go"
        if command.nb_of_arguments > 0
          $game.send(command.method_name, command.object_1)
        else
          $game.send("exits")
        end
         
         
      when "help"
        $game.send(command.method_name)
         
         
      when "info"
        $game.send(command.method_name)
        
        
      when "inventory"
        $game.send(command.method_name)
         
         
      when "items"
        $game.send(command.method_name)
        
        
      when "look"
        $game.send(command.method_name)
      
      
      when "npcs"
        $game.send(command.method_name)
        
        
      when "push"
        if command.nb_of_arguments > 0
          $game.send(command.method_name, command.object_1)
        else
          puts "What do you want to push?"
        end
        
        
      when "quit"
        $game.send(command.method_name)
        
        
      when "talk"
        if command.nb_of_arguments > 0
          $game.send(command.method_name, command.object_1)
        else
          puts "Who do you want to talk to?"
        end
        
        
      when "take"
        if command.nb_of_arguments > 0
          $game.send(command.method_name, command.object_1)
        else
          puts "What do you want to take?"
        end
        
        
      when "undress"
        if command.nb_of_arguments > 0
          $game.send(command.method_name, command.object_1)
        else
          puts "What do you want to undress?"
        end
     
        
      when "use"
        if command.nb_of_arguments > 0
          $game.send(command.method_name, command.object_1)
        else
          puts "What do you want to use?"
        end
          
          
      else
        puts "Sorry, what did you mean? Try 'help'."
        
    end
  end
end





























