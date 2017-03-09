module Conjured

  def self.update(item)
    item.sell_in -= 1
    item.sell_in <= 0 ? item.quality -= 4 : item.quality -= 2
  end

end
