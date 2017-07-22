module Api
  module V1
    class CodesController < ApplicationController
      def index
        begin
          if (params[:q])
            query = "lower(name) LIKE ?" , "%#{ params[:q].downcase }%"
            @codes = Code.where(query).limit(25)
            render json: @codes
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