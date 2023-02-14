require 'rails_helper'

RSpec.describe 'recipe_foods/index', type: :view do
  before(:each) do
    assign(:recipe_foods, [
             RecipeFood.create!,
             RecipeFood.create!
           ])
  end

  it 'renders a list of recipe_foods' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
