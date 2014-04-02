require "forwardable"

class GenericItem
  extend Forwardable
  def_delegators :@item, :name, :quality, :quality=, :sell_in, :sell_in=

  MAXIMUM_QUALITY = 50

  def initialize item
    @item = item
  end

  def adjust_quality
    decrement = sell_in < 1 ?  2 : 1
    self.quality = [0, quality - decrement].max
  end

  def decrease_sell_in
    self.sell_in -= 1
  end

  private

  attr_reader :item
end
