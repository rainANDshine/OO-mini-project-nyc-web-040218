class Allergen
  attr_reader :user, :ingredient

  @@all = []

  def initialize(user, ingredient)
    @user = user
    @ingrdient = ingredient
  end

  def self.all
    @@all
  end
end
