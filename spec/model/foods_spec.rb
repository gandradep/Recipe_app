require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create(
      name: 'Gabriel',
      email: 'user@mail.com',
      password: 'userTest'
    )
    @food = Food.new(user: @user, name: 'Tomato', measurement_unit: 'kg', price: 5, quantity: 10)
  end
  context 'Food model validations' do
    it 'name should be present' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'name should be present' do
      @food.name = ''
      expect(@food).to_not be_valid
    end

    it 'User id should be present' do
      @food.user_id = nil
      expect(@food).to_not be_valid
    end
  end
end
