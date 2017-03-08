module Brie

  def brie_update(item)
    item.sell_in -= 1
    return if item.quality == 50
    item.sell_in <= 0 ? item.quality += 2 : item.quality += 1
  end

end
