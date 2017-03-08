require_relative 'backstage'
require_relative 'brie'

class GildedRose

  include Backstage
  include Brie

  def initialize(items)
    @items = items
    @unique_items = %w(backstage sulfuras brie)
  end

  def update_quality
    @items.each do |item|
      name = item.name.downcase
      type = @unique_items.select{ |x| name.match(x) }.join
      next if type == "sulfuras"
      mod = self.class.included_modules.select { |x| x.to_s.match(type.capitalize) }
      type.empty? ? update(item) : mod.first.update(item)
    end
  end

  def update(item)
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
