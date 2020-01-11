# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  cost        :integer          not null
#  ingredients :string           not null
#  making_time :string           not null
#  serves      :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RecipesController < ApplicationController
  protect_from_forgery
  def index
    @recipes = Recipe.all
    
    render json: {
      recipes: @recipes.select(:id, :title, :making_time, :serves, :ingredients, :cost)

    }
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.present?
      render json: {
        message: "Recipe details by id",
        recipe: [
          title: @recipe.title,
          making_time: @recipe.making_time,
          serves: @recipe.serves,
          ingredients: @recipe.ingredients,
          cost: @recipe.cost
        ]
      }.to_json
    else
      render json: {
        message: "No Recipe found"
        }.to_json

    end
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.valid?
      @recipe.save
      render json: {
        message: 'Recipe successfully created!',
        recipe: [
          title: @recipe.title,
          making_time: @recipe.making_time,
          serves: @recipe.serves,
          ingredients: @recipe.ingredients,
          cost: @recipe.cost
        ]
      }.to_json
    else
      render json: {
        message: "Recipe creation failed!",
        required: "title, making_time, serves, ingredients, cost"
      }.to_json
    end

  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.present?
      @recipe.update(recipe_params)
      render json: {
      message: "Recipe successfully updated!"
      }.to_json
    else
      render json: {
        message: "No Recipe found"
        }.to_json

    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.present?
      @recipe.destroy
      render json: {
      message: "Recipe successfully removed!"
      }.to_json
    else
      render json: {
        message: "No Recipe found"
        }.to_json

    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, :making_time, :serves, :ingredients, :cost)
    end

end
