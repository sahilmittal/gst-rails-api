module Api
  module V1
    class ResourceLibrariesController < ApplicationController
      def index
        @libraries = ResourceLibrary.order('name ASC')
        render json: @libraries
      end
    end
  end
end