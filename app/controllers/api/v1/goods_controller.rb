module Api
  module V1
    class GoodsController < ApplicationController
      def index
        begin
          if (params[:category_id])
            @category = Category.find(params[:category_id])
            @goods = @category.goods
          else
            @goods = Good.order('name ASC')
          end
          render json: @goods
        rescue Exception => e
          render json: { error: 'Failed to fetch the goods' }, status: 422
        end
      end
    end
  end
end