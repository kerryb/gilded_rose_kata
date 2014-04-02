class AgedBrie < GenericItem
  def adjust_quality
    quality_increment = item.sell_in < 1 ? 2 : 1
    item.quality = [MAXIMUM_QUALITY, item.quality + quality_increment].min
  end
end
