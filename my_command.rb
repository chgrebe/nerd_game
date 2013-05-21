#combine, drop, go, look, push, talk, take, use, wear
#back, commands, exits, help, info, quit
class MyCommand
  
  attr_reader :method_name
  attr_reader :object_1
  attr_reader :object_2
  attr_reader :nb_of_arguments
  #
  def initialize(method_name = nil, object_1 = nil, object_2 = nil)
    @method_name = method_name
    @object_1 = object_1
    @object_2 = object_2
    set_nb_of_arguments
  end
  
  def set_nb_of_arguments
    if @object_1 == nil
      @nb_of_arguments = 0
      
    elsif @object_2 == nil
      @nb_of_arguments = 1
      
    else 
      @nb_of_arguments = 2
    end
  end

  
  
end
