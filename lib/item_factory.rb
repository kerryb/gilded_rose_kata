require "generic_item"
require "aged_brie"
require "legendary_item"
require "backstage_pass"

class ItemFactory
  def self.for item
    item_class = case item.name
                 when /Brie/ then AgedBrie
                 when /Sulfuras/ then LegendaryItem
                 when /Backstage pass/ then BackstagePass
                 else GenericItem
                 end
    item_class.new item
  end
end
