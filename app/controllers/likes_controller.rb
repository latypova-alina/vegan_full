class LikesController < ApplicationController
  expose :recipe
  expose :recipes, -> {current_user.liked_recipes}

  def like_recipe
    current_user.liked_recipes << recipe
  end

  def dislike_recipe
    current_user.liked_recipes.delete(recipe)
    redirect_to :back
  end

end
