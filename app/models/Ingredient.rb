class Ingredient
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def all
    @@all
  end

  def self.most_common_allergen
    names = self.all.map {|e| e.name}
    names.max_by { |i| names.count(i) }
  end
end
