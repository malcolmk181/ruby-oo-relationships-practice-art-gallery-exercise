require 'pry'
class Artist

  @@all = []

  attr_reader :name, :years_experience

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select { |painting| painting.artist == self }
  end

  def galleries
    paintings.collect { |painting| painting.gallery }
  end

  def cities
    galleries.collect { |gallery| gallery.city }
  end

  def self.total_experience
    @@all.reduce(0) { |sum, artist| sum + artist.years_experience }
  end

  def self.most_prolific
    # get all the artists
    # for each artist
      # get number of paintings and years of experience
      # divide paintings by yrs experience
    # we want to find the max of these numbers, and return the corresponding artist

    # tracker variable for most prolific artist so far
    # do the loop
      # in the loop, compare current artist against most prolific artist so far
    # return that artist

    # most_prolific_artist = nil
    # most_prolific_value = 0
    # @@all.each do |artist|
    #   value = artist.paintings.count / artist.years_experience
    #   value > most_prolific_value ? most_prolific_value = value && most_prolific_artist = artist : nil
    # end
    # most_prolific_artist

    most_prolific_artist2 = Artist.all.max {|artist1, artist2| (artist1.paintings.count / artist1.years_experience) <=> (artist2.paintings.count / artist2.years_experience) }
  end

  def create_painting(title, price, gallery)
    painting = Painting.new(title, price)
    painting.artist = self
    painting.gallery = gallery
  end

end

# a = Artist.new("joe", 7)
# b = Artist.new("mama", 10)

# binding.pry