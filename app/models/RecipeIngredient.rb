class RecipeIngredient
  attr_reader :ingredient, :recipe

  @@all = []

  def initialize(ingredient, recipe)
    @ingredient = ingredient
    @recipe = recipe
  end

  def self.all
    @@all
  end

  def ingredient
    @ingredient
  end

  def recipe
    @recipe
  end

end
