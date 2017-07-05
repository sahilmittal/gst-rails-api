module Api
  module V1
    class GoodsController < ApplicationController
      def index
        if (params[:category_id])
          @category = Category.find(params[:category_id])
          @goods = @category.goods
        elsif (params[:q])
          @goods = Good.where("name LIKE ?" , "%#{ params[:q] }%")
        else
          @goods = Good.order('name ASC')
        end
        render json: @goods
      end
    end
  end
end