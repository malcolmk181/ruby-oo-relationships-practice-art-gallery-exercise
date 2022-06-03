require 'pry'
class Painting

  attr_accessor :artist, :gallery

  attr_reader :title, :price

  @@all = []

  def initialize(title, price)
    @title = title
    @price = price

    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.total_price
    self.all.reduce(0) { |sum, painting| sum + painting.price }
  end

end

# binding.pry