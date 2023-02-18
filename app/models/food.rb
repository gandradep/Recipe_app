class Food < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :measurement_unit, presence: true, allow_blank: false
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
  def custom_text
    "#{name} #{measurement_unit}"
  end
end
