class User
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select do |record|
      record.user == self
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |record|
      record.user == self
    end
  end

  def top_three_recipes
    self.recipes.each.sort {|a, b| a.rating <=> b.rating}.reverse.first(3)
  end

  def most_recent_recipe
    self.recipes.last
  end

  def safe_recipes
    user_allergiies = Allergen.select {|i| i.user == self}
    user_allergic_c_ingredients = user_allergiies.map {|i| i.ingredients}
    user_recipes = RecipeCard.map {|i| i.recipe if i.user == self}
    user_all_ingredients = user_recipes.map {|i| i.ingredients}
    (user_allergic_ingredients.flatten - user_allergic_ingredients.flatten).uniq
  end
end
