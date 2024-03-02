class CategoriesController < ApplicationController

    before_action :find_category, only: [:show, :update, :destroy]

    def create
        category = Category.new(category_params)
        if category.save
            render json: category, status: :created
        else
            render json: category.errors, status: :unprocessable_entity
        end
    end

    def index
        categories = Category.all
        render json: categories
    end

    def show
        render json: category
    end

    def update
        render json: category.update(category_params)
    end

    def destroy
        category.destroy
    end

    private

    def find_category
        category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end
end
