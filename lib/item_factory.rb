require "generic_item"
require "aged_brie"
require "legendary_item"
require "backstage_pass"
require "conjured_item"

class ItemFactory
  def self.for item
    item_class = case item.name
                 when /Brie/ then AgedBrie
                 when /Sulfuras/ then LegendaryItem
                 when /Backstage pass/ then BackstagePass
                 when /Conjured/ then ConjuredItem
                 else GenericItem
                 end
    item_class.new item
  end
end
