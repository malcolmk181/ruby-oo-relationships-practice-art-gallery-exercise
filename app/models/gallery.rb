class Gallery

  @@all = []

  attr_reader :name, :city

  def initialize(name, city)
    @name = name
    @city = city

    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select {|painting| painting.gallery == self }
  end

  def artists
    paintings.collect {|painting| painting.artist }
  end

  def artist_names
    artists.collect {|artist| artist.name }
  end

  def most_expensive_painting
    paintings.max {|p1, p2| p1.price <=> p2.price }

    # improvement, use max_by
    # paintings.max_by {|painting| painting.price }
  end

end
