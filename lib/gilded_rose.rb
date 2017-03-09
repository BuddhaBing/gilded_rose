require_relative 'normal'
require_relative 'brie'
require_relative 'backstage'
require_relative 'conjured'

class GildedRose

  include Normal
  include Brie
  include Backstage
  include Conjured

  UNIQUES = %w(backstage sulfuras brie conjured)

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      type = UNIQUES.select{ |x| item.name.downcase.match(x) }.join
      next if type == "sulfuras"
      mod = self.class.included_modules.select{ |x| x.to_s.match(type.capitalize) }
      type.empty? ? Normal.update(item) : mod.first.update(item)
    end
  end

end
