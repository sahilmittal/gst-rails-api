module Api
  module V1
    class ResourcesController < ApplicationController
      def index
        if (params[:resource_library_id])
          @library = ResourceLibrary.find(params[:resource_library_id])
          @resources = @library.resources
        else
          @resources = Resource.order('name ASC')
        end
        render json: @resources
      end
      def download
        resource = Resource.find(params[:id])
        file = "vendor/Resource Library/#{ resource.resource_library.name }/#{ resource.name }.pdf"
        File.open(file, 'r') do |f|
          send_data f.read.force_encoding('BINARY'), :filename => "#{ resource.name }.pdf", :type => "application/pdf", :disposition => "attachment"
        end
      end
    end
  end
end