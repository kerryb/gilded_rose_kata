MAXIMUM_QUALITY = 50

def update_quality(items)
  items.each do |item|
    if increasing_quality?(item) 
      increase_quality(item)
    elsif !legendary?(item) 
      decrease_quality(item)
    end

    if item.sell_in < 1
      if brie?(item)
        increase_quality(item)
      else
        if backstage_pass?(item)
          item.quality = 0
        elsif !legendary?(item)
          decrease_quality(item)
        end
      end
    end

    item.sell_in -= 1 unless legendary?(item)
  end
end

private

def increasing_quality?(item)
  brie?(item) || backstage_pass?(item)
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
  item.quality = [MAXIMUM_QUALITY, item.quality + quality_increment_for(item)].min
end

def decrease_quality(item)
  item.quality -= 1 unless item.quality <= 0
end

def quality_increment_for(item)
  if backstage_pass?(item)
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
