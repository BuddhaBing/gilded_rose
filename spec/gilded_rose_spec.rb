require 'gilded_rose'
require_relative 'factories/item_factory'

describe GildedRose do
  let(:items) { item_gen }
  let(:normal_item) { instance_double("Item", :name => "+5 Dexterity Vest", :sell_in => 10, :quality => 20) }
  subject { described_class.new(items) }
  it 'initializes with one argument (items)' do
    expect(described_class).to respond_to(:new).with(1).argument
  end
  context '#out_of_date?' do
    it 'reports false when an item is in date' do
      expect(subject.out_of_date?(normal_item)).to be false
    end
    it 'reports true when an item is out of date' do
      allow(normal_item).to receive(:sell_in).and_return(0)
      expect(subject.out_of_date?(normal_item)).to be true
    end
  end
end
