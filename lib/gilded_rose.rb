class GildedRose

  def initialize(items)
    @items = items
    @unique_items = %w(backstage sulfuras brie)
  end

  def update_quality
    @items.each do |item|
      name = item.name.downcase
      update_backstage(item) if name.match(/backstage/)
      update_brie(item) if name.match(/brie/)
      update_normal(item) unless name.match(@unique_items.each)
    end
  end

  def update_backstage(item)
    item.sell_in -= 1
    return item.quality = 0 if item.sell_in <= 0
    return if item.quality == 50
    item.sell_in <= 10 ? item.quality += 2 : item.quality += 1
    item.quality += 1 if item.sell_in <= 5
  end

  def update_brie(item)
    item.sell_in -= 1
    return if item.quality == 50
    item.sell_in <= 0 ? item.quality += 2 : item.quality += 1
  end

  def update_normal(item)
    item.sell_in -= 1
    item.sell_in <= 0 ? item.quality -= 2 : item.quality -= 1
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
