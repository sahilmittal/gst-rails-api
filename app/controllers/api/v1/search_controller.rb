module Api
  module V1
    class SearchController < ApplicationController
      def index
        begin
          if (params[:q])
            @goods = Good.where("name LIKE ?" , "%#{ params[:q] }%")
            @services = Service.where("name LIKE ?" , "%#{ params[:q] }%")
            response = @goods + @services
            render json: response
          else
            render json: { error: 'Parameter `q` is missing!' }, status: 422
          end
        rescue Exception => e
          render json: { error: 'Failed to perform search' }, status: 422
        end
      end
    end
  end
end