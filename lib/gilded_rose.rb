require_relative 'backstage'
require_relative 'brie'
require_relative 'normal'

class GildedRose

  include Backstage
  include Brie
  include Normal

  UNIQUES = %w(backstage sulfuras brie)

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      type = UNIQUES.select{ |x| item.name.downcase.match(x) }.join
      next if type == "sulfuras"
      mod = self.class.included_modules.select { |x| x.to_s.match(type.capitalize) }
      type.empty? ? Normal.update(item) : mod.first.update(item)
    end
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
