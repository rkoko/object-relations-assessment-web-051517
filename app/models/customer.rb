require_relative "restaurant.rb"
require_relative "review.rb"
require "pry"

class Customer
  attr_accessor :first_name, :last_name


  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @reviews = []
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end


  def self.all
    @@all
  end

  def self.find_by_name(full_name)
    self.all.detect{|customer| customer.full_name == full_name}
  end

  def self.find_all_by_first_name(first_name)
    self.all.select{|customer| customer.first_name == first_name}
  end

  def self.all_names
    self.all.collect{|customer| customer.full_name}
  end

  def reviews
    @reviews
  end

  
  def add_review_by_review(review)
    review.customer = self
    self.reviews<<review
  end

  def add_review(content, restaurant)
    new_review = Review.new(content, restaurant)
    new_review.customer = self
    self.reviews<<new_review
  end


end

rinda = Customer.new("Rinda", "Ko")
rinda_bot = Customer.new("Rinda", "Bot")
bob = Customer.new("Bob", "Bobby")
ornella = Restaurant.new("ornella")
ophelia = Restaurant.new("ophelia")

binding.pry
rev_1 = Review.new("3 stars", ornella )
