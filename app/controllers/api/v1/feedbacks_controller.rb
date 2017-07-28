module Api
  module V1
    class FeedbacksController < ApplicationController

      before_action :load_feedback, only: [:toggle_resolved]

      def index
        @feedbacks = Feedback.where(nil)
        @feedbacks = @feedbacks.resolved(params[:resolved].to_bool) if params[:resolved].present?
        @feedbacks = @feedbacks.user_email(params[:user_email]) if params[:user_email].present?
  
        render json: @feedbacks
      end

      def create
        begin
          @feedback = Feedback.new(create_feedback_params)
          if @feedback.save
            render json: @feedback
          else
            render json: { errors: @feedback.errors.full_messages }, status: 422
          end
        rescue Exception => e
          render json: { error: 'Failed to save the feedback' }, status: 422
        end
      end

      def toggle_resolved
        @feedback.assign_attributes(toggle_resolve_feedback_params)
        if @feedback.save
          render json: @feedback
        else
          render json: { errors: @feedback.errors.full_messages }, status: 422
        end
      end

      private

        def create_feedback_params
          { 
            message: params[:message], user_email: params[:email]
          }
        end

        def toggle_resolve_feedback_params
          { resolved: !@feedback.resolved }
        end

        def load_feedback
          @feedback = Feedback.where(id: params[:id]).first
          unless @feedback
            render json: { error: 'Feedback not found' }, status: 404 and return
          end
        end

    end
  end
end