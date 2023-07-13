class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validate :password_confirmation_match

  # def password_confirmation_match
  # if password != password_confirmation
  #   puts "====================================================="
  #   puts password
  #   puts password_confirmation
  #   puts "==============================================================="
  #   errors.add(:password_confirmation, "must match the password")
  # end
  # end

  validates :full_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }


  has_many :spends, class_name: 'Spend', foreign_key: 'author_id'
  has_many :categories, class_name: 'Category', foreign_key: 'author_id'

end
