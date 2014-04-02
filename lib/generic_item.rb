class GenericItem
  def initialize item
    @item = item
  end

  def self.for item
    new item
  end

  def adjust_quality
    if increasing_quality?
      item.quality = [MAXIMUM_QUALITY, item.quality + quality_increment_for].min
    end

    if backstage_pass?
      item.quality = 0 if item.sell_in < 1
    else
      decrement = item.sell_in < 1 ?  2 : 1
      item.quality -= decrement unless item.quality <= 0 || non_degrading?
    end
  end

  def decrease_sell_in
    item.sell_in -= 1 unless legendary?
  end

  private

  attr_reader :item

  def increasing_quality?
    brie? || backstage_pass?
  end

  def non_degrading?
    legendary? || brie?
  end

  def legendary?
    item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def backstage_pass?
    item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def brie?
    item.name == 'Aged Brie'
  end

  def quality_increment_for
    if brie? && item.sell_in < 1
      return 2
    elsif backstage_pass?
      if item.sell_in < 6
        return 3
      elsif item.sell_in < 11
        return 2
      end
    end
    return 1
  end
end
