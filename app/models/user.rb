class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :basket, dependent: :destroy

  enum role: {
      user: "user",
      administrator: "administrator"
  }

  after_create :create_basket

  def create_basket
    Basket.create(user_id: id)
  end

end
