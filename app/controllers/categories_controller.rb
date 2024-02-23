class CategoriesController < ApplicationController

    def create
        @category = Category.new(category_params)
        if @category.save
            render json: @category, status: :created
        else
            render json: @category.errors, status: :unprocessable_entity
        end
    end

    def index
        categories = Category.all
        render json: categories
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
end
