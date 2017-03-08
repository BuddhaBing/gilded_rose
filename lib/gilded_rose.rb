class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      name = item.name.downcase
      update_backstage(item) if name.match(/backstage/)
    end
  end

  def update_backstage(item)
    item.sell_in -= 1
    return item.quality = 0 if item.sell_in <= 0
    return if item.quality == 50
    item.quality += 1
    item.quality += 1 if item.sell_in <= 10
    item.quality += 1 if item.sell_in <= 5
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
