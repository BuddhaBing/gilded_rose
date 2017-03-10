# Gilded Rose Kata

[![Build Status](https://travis-ci.org/treborb/gilded_rose.svg?branch=master)](https://travis-ci.org/treborb/gilded_rose)
[![codecov](https://codecov.io/gh/treborb/gilded_rose/branch/master/graph/badge.svg)](https://codecov.io/gh/treborb/gilded_rose)

#### Ruby v2.3.3
### [Makers Academy] (http://www.makersacademy.com) - Week 10 Solo Practice Tech Test

## Index
* [Installation] (#Install)
* [Tests] (#Tests)
* [Usage] (#Usage)

## The brief

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin sell_ing a new category of items. First an introduction to our system:

	- All items have a sell_in value which denotes the number of days we have to sell the item
	- All items have a quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, quality degrades twice as fast
	- The quality of an item is never negative
	- "Aged Brie" actually increases in quality the older it gets
	- The quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in quality
	- "Backstage passes", like aged brie, increases in quality as its sell_in value approaches;
	quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in quality twice as fast as normal items

Feel free to make any changes to the Updatequality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the Updatequality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its quality increase above 50, however "Sulfuras" is a
legendary item and as such its quality is 80 and it never alters.

## <a id="Install">Installation</a>

```
$ git clone https://github.com/treborb/gilded_rose.git
$ cd gilded_rose
$ rvm 2.3.3
$ gem install bundler
$ bundle
```
## <a id="Usage">Usage</a>

#### Load up your favourite REPL (e.g. irb)

```
$ irb
```

#### In the REPL
```ruby
$ require "./lib/gilded_rose"
$ items = [
			Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
			Item.new(name="Aged Brie", sell_in=2, quality=10),
			Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=40),
			Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
			Item.new(name="Conjured Mana Hat", sell_in=15, quality=20),
		  ]
$ rose = GildedRose.new(items)
$ rose.update_quality
```

## <a id=“Tests">Running the tests</a>
```ruby
$ rspec
```
