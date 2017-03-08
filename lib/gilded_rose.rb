require_relative 'backstage'
require_relative 'brie'

class GildedRose

  include Backstage
  include Brie

  def initialize(items)
    @items = items
    @unique_items = %i{backstage sulfuras brie}
  end

  def update_quality
    @items.each do |item|
      name = item.name.downcase
      match = @unique_items.select{ |x| name.match(x.to_s) }.join.to_sym
      next if match == :sulfuras
      match.empty? ? normal_update(item) : send("#{match}_update", item)
    end
  end

  def normal_update(item)
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
