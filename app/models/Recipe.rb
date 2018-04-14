class Recipe

attr_reader :name
@@all = []
def initialize(name)
  @name = name
  @@all << self
end

def self.all
  @@all
end

def self.most_popular
  names = self.all.map {|e| e.name}
  names.max_by { |i| names.count(i) }
end



 def users
   RecipeCard.all.select do |record|
    record.recipe == self
 end
end

 def ingredients
   RecipeIngredient.all.select do |record|
    record.recipe == self
  end
 end

 def allergens
allergies = self.ingredients.select { |i| Allergen.all.inlude?(i) }
allergies
 end

 def add_ingredients

 end

end
