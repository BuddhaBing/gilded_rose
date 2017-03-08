module Backstage

  def self.update(item)
    item.sell_in -= 1
    return item.quality = 0 if item.sell_in <= 0
    return if item.quality == 50
    item.sell_in <= 10 ? item.quality += 2 : item.quality += 1
    item.quality += 1 if item.sell_in <= 5
  end

end
