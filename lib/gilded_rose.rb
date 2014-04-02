require "generic_item"

MAXIMUM_QUALITY = 50

def update_quality(items)
  items.map {|i| GenericItem.for(i) }.each do |item|
    item.adjust_quality
    item.decrease_sell_in
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)
