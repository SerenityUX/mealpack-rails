class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      p = params.require(:recipe).permit(:name, :description, ingredients: [], directions: [])
      p[:ingredients] = (p[:ingredients] || []).reject(&:blank?)
      p[:directions] = (p[:directions] || []).reject(&:blank?)
      p
    end
end
