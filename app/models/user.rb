class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :basket, dependent: :destroy

  enum role: {
      user: "user",
      administrator: "administrator"
  }

end
