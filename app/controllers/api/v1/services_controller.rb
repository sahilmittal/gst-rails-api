module Api
  module V1
    class ServicesController < ApplicationController
      def index
        begin
          @services = Service.order('created_at ASC')
          render json: @services
        rescue Exception => e
          render json: { error: 'Failed to fetch the services' }, status: 422
        end
      end
    end
  end
end