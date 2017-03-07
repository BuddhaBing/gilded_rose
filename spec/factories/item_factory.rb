require './lib/gilded_rose'

normal_item = Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)
brie = Item.new(name="Aged Brie", sell_in=2, quality=0)
sulfuras = Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80)
backstage = Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)

items = [normal_item, brie, sulfuras, backstage]

# def item_gen
#   [
#     Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
#     Item.new(name="Aged Brie", sell_in=2, quality=0),
#     Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
#     Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
#     Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
#     Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
#     Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
#     Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
#     # This Conjured item does not work properly yet
#     Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
#   ]
# end
#
# items = [
#   Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
#   Item.new(name="Aged Brie", sell_in=2, quality=0),
#   Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
#   Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
#   Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
#   Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
#   Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
#   Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
#   # This Conjured item does not work properly yet
#   Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
# ]
#
# items.each(&update)
#
# rose = GildedRose.new(items)
#
# rose.update_quality
#
# [ "+5 Dexterity Vest", "Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Backstage passes to a FADSDFADS concert" ]
