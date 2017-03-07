class GildedRose

  MIN_QUALITY = 0
  MAX_QUALITY = 50
  NORMAL_DEGREDATION = -1

  def initialize(items)
    @items = items
  end

  def update_quality()
    update = -> (item) do
      qual_adjust = { "backstage pass": { 0 => -item.quality, 5 => 3, 10 => 2, MAX_QUALITY => 1 },
                      "aged brie": { MAX_QUALITY => 1 },
                      "sulfurus": { MAX_QUALITY => 0 },
                      "normal": { MAX_QUALITY => NORMAL_DEGREDATION }
                    }
      match = qual_adjust.select { |key,val| item.name.downcase.include?(key.to_s) }.keys
      match = match.empty? ? :normal : match.first.to_sym
      _, adjustment = qual_adjust[match].find { |key ,_| item.sell_in <= key }
      adjustment = NORMAL_DEGREDATION if !adjustment
      adjustment *= 2 if out_of_date?(item)
      item.quality += adjustment unless item.name.match(/[Ss]ulfuras/)
      item.quality = MIN_QUALITY if item.quality <= MIN_QUALITY
      item.quality = MAX_QUALITY if item.quality >= MAX_QUALITY
      item.sell_in -= 1 unless item.name.match(/[Ss]ulfuras/)
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
