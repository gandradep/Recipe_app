class Recipe < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  belongs_to :user, foreign_key: true
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods
end
