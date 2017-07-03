module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @categories = Category.order('created_at ASC')
        render json: @categories
      end
    end
  end
end