class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @reviews = []
    @@all << self
  end

  def add_review(review)
    @reviews<<review
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect{|restaurant| restaurant.name == name }
  end

  def reviews
    @reviews
  end

  def customers
    self.reviews.collect{|review| review.customer}
  end

end
