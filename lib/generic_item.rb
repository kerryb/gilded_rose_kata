require "forwardable"

class GenericItem
  extend Forwardable
  def_delegators :@item, :name, :quality, :quality=, :sell_in, :sell_in=

  MAXIMUM_QUALITY = 50

  def initialize item
    @item = item
  end

  def adjust_quality
    if increasing_quality?
      self.quality = [MAXIMUM_QUALITY, quality + quality_increment_for].min
    end

    if backstage_pass?
      self.quality = 0 if sell_in < 1
    else
      decrement = sell_in < 1 ?  2 : 1
      self.quality -= decrement unless quality <= 0
    end
  end

  def decrease_sell_in
    self.sell_in -= 1
  end

  private

  attr_reader :item

  def increasing_quality?
    backstage_pass?
  end

  def backstage_pass?
    self.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def quality_increment_for
    if backstage_pass?
      if sell_in < 6
        return 3
      elsif sell_in < 11
        return 2
      end
    end
    return 1
  end
end
