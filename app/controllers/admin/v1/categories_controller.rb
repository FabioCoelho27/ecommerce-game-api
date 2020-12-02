module Admin::V1
    
  class Admin::V1::CategoriesController < ApiController

    def index
      @categories = Category.all
    end
  end
end
