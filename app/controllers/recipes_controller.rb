class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    # logged in user recipes
    @user_test = current_user
    @recipes = Recipe.where(user: @user_test)
  end

  def public_recipes
    @recipes = Recipe.all
  end

  def show
    @precipe = Recipe.find(params[:id])
    @ingredients = RecipeFood.where(recipe: @precipe)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    usert = current_user
    @recipe = Recipe.new(recipe_params)
    @recipe.user = usert
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shop_list
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = RecipeFood.where(recipe: @recipe)
    @foods = Food.where(user: current_user)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    # p 'ge'
    # p params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
    # p 'en'
  end
end
