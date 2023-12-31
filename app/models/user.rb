class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :full_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates_confirmation_of :password

  has_many :spends, class_name: 'Spend', foreign_key: 'author_id'
  has_many :categories, class_name: 'Category', foreign_key: 'author_id'
end
