class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :full_name, presence: true 
  validates :email, uniqueness: { case_sensitive: false }

  has_many :spends, class_name: "spend", foreign_key: "author_id"
  has_many :categories, class_name: "category", foreign_key: "author_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
