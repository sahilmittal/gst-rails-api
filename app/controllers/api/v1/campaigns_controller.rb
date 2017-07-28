module Api
  module V1
    class CampaignsController < ApplicationController

      def index
        @campaigns = Campaign.order('created_at DESC')
        render json: @campaigns
      end

      def create
        begin
          @campaign = Campaign.new(create_campaign_params)
          if @campaign.save
            render json: @campaign
          else
            render json: { errors: @campaign.errors.full_messages }, status: 422
          end
        rescue Exception => e
          render json: { error: 'Failed to save the campaign' }, status: 422
        end
      end

      private

        def create_campaign_params
          { 
            source: params[:source], medium: params[:medium], term: params[:term], content: params[:content], name: params[:name]
          }
        end

    end
  end
end