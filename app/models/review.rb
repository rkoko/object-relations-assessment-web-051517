class Review

  attr_accessor :restaurant, :content, :customer

  @@all = []

  def initialize(content, restaurant)
    @content = content
    @restaurant = restaurant
    @@all << self
    restaurant.add_review(self)
  end

  def self.all
    @@all
  end

  #customer; #restaurant are in the attr_accessor


end
