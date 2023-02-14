require 'rails_helper'

RSpec.describe 'recipe_foods/show', type: :view do
  before(:each) do
    assign(:recipe_food, RecipeFood.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
