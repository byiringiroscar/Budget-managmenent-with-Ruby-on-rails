class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :spends, class_name: "spend", foreign_key: "reference_id"
  has_many :categories, class_name: "category", foreign_key: "reference_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
