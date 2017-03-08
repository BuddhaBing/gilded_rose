module Normal

  def self.update(item)
    item.sell_in -= 1
    item.sell_in <= 0 ? item.quality -= 2 : item.quality -= 1
  end

end
