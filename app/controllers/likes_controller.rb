class LikesController < ApplicationController
  expose :recipe

  def like_recipe
    current_user.liked_recipes << recipe
    redirect_to :back
  end
end
