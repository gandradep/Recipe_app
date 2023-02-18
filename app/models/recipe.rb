class Recipe < ApplicationRecord
  validates :name, presence: true, allow_blank: false

  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  def total_cost
    total = 0
    recipe_foods.includes(:food).each do |public_recipe|
      total += public_recipe.quantity * public_recipe.food.price
    end
    total.round(2)
  end
end
