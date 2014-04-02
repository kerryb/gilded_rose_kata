require "generic_item"
require "aged_brie"

class ItemFactory
  def self.for item
    item_class = case item.name
                 when "Aged Brie" then AgedBrie
                 else GenericItem
                 end
    item_class.new item
  end
end
