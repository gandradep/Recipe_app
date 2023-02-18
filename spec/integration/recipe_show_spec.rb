require 'rails_helper'

RSpec.describe 'Public Recipe show', type: :system do
  describe 'index page' do
    before(:example) do
      @user = User.create(
        name: 'Gabriel',
        email: 'user1@mail.com',
        password: 'anything',
        confirmed_at: Time.now.utc
      )

      @recipe = Recipe.create(
        name: 'Pizza',
        preparation_time: 10,
        cooking_time: 10,
        description: 'ok is good',
        public: true,
        user_id: @user.id
      )
      @recipe2 = Recipe.create(
        name: 'Salads',
        preparation_time: 10,
        cooking_time: 10,
        description: 'ok is good',
        public: false,
        user_id: @user.id
      )

      visit root_path
    end

    it 'renders correct name of food' do
      expect(page).to have_content(@recipe.name)
      expect(page).not_to have_content(@recipe2.name)
    end
  end
end
