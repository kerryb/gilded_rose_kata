require "forwardable"

class GenericItem
  extend Forwardable
  def_delegators :@item, :name, :quality, :quality=, :sell_in, :sell_in=

  MAXIMUM_QUALITY = 50

  def initialize item
    @item = item
  end

  def adjust_quality
    self.quality = [0, quality - quality_decrement_rate].max
  end

  def decrease_sell_in
    self.sell_in -= 1
  end

  private

  attr_reader :item

  def quality_decrement_rate
    sell_in < 1 ?  2 : 1
  end
end
