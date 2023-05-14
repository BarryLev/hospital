class CategoriesController < ApplicationController
  def index
    @categories = collection
  end

  private

  def collection
    Category.all
  end
end
