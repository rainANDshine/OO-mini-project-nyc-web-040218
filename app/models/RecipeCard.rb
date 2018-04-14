class Recipecard
  attr_accessor :user, :recipe, :rating
  attr_reader :date
@@all = []
  def initialize(user, recipe, date = Time.now, rating)
    @user = user
    @recipe = recipe
    @date = date
     @@all << self
  end


def  self.all
    @@all
end

  def date
    @date
  end

def rating
  @rating
end

def user
  @user
end

def recipe
  @recipe
end

end
