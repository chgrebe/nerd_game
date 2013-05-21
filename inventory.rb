class Inventory
  attr_reader :items
  #
  def initialize(items = Hash.new(0))
    @items = items
  end

  def add_item(item)
    @items[item] += 1
  end

  def remove_item(item)
    if @items.has_key?(item)
      @items.delete(item)
    else 
      false
    end
  end

  def has_item?(item)
    return true if @items.has_key(item)
    false
  end
  
  def get_items
    @items.keys.to_a
  end

end