MAXIMUM_QUALITY = 50

def update_quality(items)
  items.each do |item|
    adjust_quality(item)
    decrease_sell_in(item)
  end
end

private

def adjust_quality(item)
  increase_quality(item)
  decrease_quality(item)
end

def decrease_sell_in(item)
  item.sell_in -= 1 unless legendary?(item)
end

def increasing_quality?(item)
  brie?(item) || backstage_pass?(item)
end

def non_degrading?(item)
  legendary?(item) || brie?(item)
end

def legendary?(item)
  item.name == 'Sulfuras, Hand of Ragnaros'
end

def backstage_pass?(item)
  item.name == 'Backstage passes to a TAFKAL80ETC concert'
end

def brie?(item)
  item.name == 'Aged Brie'
end

def increase_quality(item)
  return unless increasing_quality?(item)
  item.quality = [MAXIMUM_QUALITY, item.quality + quality_increment_for(item)].min
end

def decrease_quality(item)
  if backstage_pass?(item)
    item.quality = 0 if item.sell_in < 1
  else
    decrement = item.sell_in < 1 ?  2 : 1
    item.quality -= decrement unless item.quality <= 0 || non_degrading?(item)
  end
end

def quality_increment_for(item)
  if brie?(item) && item.sell_in < 1
    return 2
  elsif backstage_pass?(item)
    if item.sell_in < 6
      return 3
    elsif item.sell_in < 11
      return 2
    end
  end
  return 1
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)
