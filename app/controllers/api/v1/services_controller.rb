module Api
  module V1
    class ServicesController < ApplicationController
      def index
        if (params[:q])
          @services = Service.where("name LIKE ?" , "%#{ params[:q] }%")
        else
          @services = Service.order('created_at ASC')
        end
        render json: @services
      end
    end
  end
end