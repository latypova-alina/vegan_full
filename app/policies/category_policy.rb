class CategoryPolicy < ApplicationPolicy
  def create?
    @user.administrator?
  end

  def update?
    @user.administrator?
  end

  def edit?
    @user.administrator?
  end

  def destroy?
    @user.administrator?
  end
end
