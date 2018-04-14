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

  def add_recipe_card(recipe, date, rating)
    Recipecard.new(self, recipe, date, rating)
    # should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
    # should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
  end

  def allergens
    Allergen.all.select do |record|
      record.user == self
    # should return all of the ingredients this user is allergic to
  end

  def top_three_recipes
 recipes.each.sort {|a, b| a.rating <=> b.rating}.reverse.first(3)
      end
    # should return the top three highest rated recipes for this user.


  def most_recent_recipe
    recipes.last
    # should return the recipe most recently added to the user's cookbook.
  end


  def safe_recipes
      user_allergic_ingredients = Allergen.select {|i| i.user == self}
      user_recipes = RecipeCard.map {|i| i.recipe if i.user == self}
      user_all_ingredients = user_recipes.each {|i| i.ingredients}
      user_allergic_ingredients.flatten - user_allergic_ingredients.flatten

  end

end