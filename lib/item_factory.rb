require "generic_item"
require "aged_brie"
require "legendary_item"

class ItemFactory
  def self.for item
    item_class = case item.name
                 when /Brie/ then AgedBrie
                 when /Sulfuras/ then LegendaryItem
                 else GenericItem
                 end
    item_class.new item
  end
end
