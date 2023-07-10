class Spend < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  validates_presence_of :name, :amount, :author_id
end
