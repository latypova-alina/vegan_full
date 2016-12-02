class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, object = nil)
    @user = user
    @object = object
  end


end
