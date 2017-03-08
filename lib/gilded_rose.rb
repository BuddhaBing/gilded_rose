class GildedRose

  MIN_QUALITY = 0
  MAX_QUALITY = 50
  NORMAL_DEGREDATION = -1

  def initialize(items)
    @items = items
    @qual_adjust = { "backstage pass": { 0 => -MAX_QUALITY, 5 => 3, 10 => 2, MAX_QUALITY => 1 },
                    "aged brie": { MAX_QUALITY => 1 },
                    "sulfuras": { MAX_QUALITY => 0 },
                    "normal": { MAX_QUALITY => NORMAL_DEGREDATION }
                   }
  end

  def update_quality()
    update = -> (item) do
      match = @qual_adjust.select { |k,v| item.name.downcase.include?(k.to_s) }.keys
      match = match.empty? ? :normal : match.first.to_sym
      _, adjustment = @qual_adjust[match].find { |key ,_| item.sell_in <= key }
      adjustment *= 2 if out_of_date?(item)
      item.quality += adjustment unless match == :sulfuras
      item.quality = MIN_QUALITY if item.quality <= MIN_QUALITY
      item.quality = MAX_QUALITY if item.quality >= MAX_QUALITY
      item.sell_in -= 1 unless match == :sulfuras
    end
    @items.each(&update)
  end

  def out_of_date?(item)
    item.sell_in <= 0
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
