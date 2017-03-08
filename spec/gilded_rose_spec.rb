require 'gilded_rose_legacy'
require 'gilded_rose'
# require_relative 'factories/item_factory'

describe GildedRose do
  let(:normal_item) {Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)}
  let(:brie) {Item.new(name="Aged Brie", sell_in=2, quality=10)}
  let(:sulfuras) {Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=40)}
  let(:backstage) {Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)}
  let(:items) { [normal_item, brie, sulfuras, backstage] }
  # let(:items) { items }
  # let(:normal_item) { instance_double(Item, :name => "+5 Dexterity Vest", :sell_in => 10, :quality => 20) }
  # let(:aged_brie) { instance_double(Item, :name => "Aged Brie", :sell_in => 10, :quality => 20) }
  subject { described_class.new(items) }
  it 'initializes with one argument (items)' do
    expect(described_class).to respond_to(:new).with(1).argument
  end
  describe "#update_quality" do

    context 'sell in value >= 0' do
      context 'normal item' do
        it 'decreases the quality of a normal item by 1' do
          expect{subject.update_quality}.to change{normal_item.quality}.by(-1)
        end
      end
      context 'backstage pass' do
        it 'increases the quality of a backstage pass (sell_in > 10) by 1' do
          expect{subject.update_quality}.to change{backstage.quality}.by(1)
        end
        it 'increases the quality of a backstage pass (sell_in <= 10 && sell_in > 5) by 2' do
          allow(backstage).to receive(:sell_in).and_return(10)
          expect{subject.update_quality}.to change{backstage.quality}.by(2)
        end
        it 'increases the quality of a backstage pass (sell_in <= 5 && sell_in > 0) by 2' do
          allow(backstage).to receive(:sell_in).and_return(5)
          expect{subject.update_quality}.to change{backstage.quality}.by(3)
        end
      end
      context 'aged brie' do
        it 'increases the quality of aged brie item by 1' do
          expect{subject.update_quality}.to change{brie.quality}.by(1)
        end
      end
      context 'sulfuras' do
        it 'does not affect the quality of sulfuras' do
          expect{subject.update_quality}.not_to change{sulfuras.quality}
        end
        it 'does not affect the sell in value of sulfuras' do
          expect{subject.update_quality}.not_to change{sulfuras.sell_in}
        end
      end
    end

    context 'sell in value < 0' do
      context 'normal item' do
        it 'decreases the quality of a normal item by 2' do
          allow(normal_item).to receive(:sell_in).and_return(-1)
          expect{subject.update_quality}.to change{normal_item.quality}.by(-2)
        end
      end
      context 'backstage pass' do
        it 'decreases the quality of a backstage pass (sell_in < 0) to 0' do
          allow(backstage).to receive(:sell_in).and_return(-1)
          expect{subject.update_quality}.to change{backstage.quality}.by(-backstage.quality)
        end
      end
      context 'aged brie' do
        it 'increases the quality of aged brie item by 2' do
          allow(brie).to receive(:sell_in).and_return(-1)
          expect{subject.update_quality}.to change{brie.quality}.by(2)
        end
      end
      context 'sulfuras' do
        before do
          allow(sulfuras).to receive(:sell_in).and_return(-1)
        end
        it 'does not affect the quality of sulfuras' do
          expect{subject.update_quality}.not_to change{sulfuras.quality}
        end
        it 'does not affect the sell in value of sulfuras' do
          expect{subject.update_quality}.not_to change{sulfuras.sell_in}
        end
      end
    end

    context 'quantity limitations' do
      it 'the quality of an item is never negative' do
        normal = Item.new(name="Normal", sell_in=2, quality=0)
        rose = described_class.new([normal])
        expect{subject.update_quality}.not_to change{normal.quality}
      end
      it 'the quality of an item is never more than 50' do
        aged_brie = Item.new(name="Aged Brie", sell_in=2, quality=50)
        rose = described_class.new([aged_brie])
        expect{rose.update_quality}.not_to change{aged_brie.quality}
      end
    end

  end
  # context '#out_of_date?' do
  #   it 'reports false when an item is in date' do
  #     expect(subject.out_of_date?(normal_item)).to be false
  #   end
  #   it 'reports true when an item is out of date' do
  #     allow(normal_item).to receive(:sell_in).and_return(0)
  #     expect(subject.out_of_date?(normal_item)).to be true
  #   end
  # end
end
