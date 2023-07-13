class Category < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :author, class_name: 'User'
  has_many :spends, dependent: :destroy
  validates_presence_of :name, :author_id, :icon
end
