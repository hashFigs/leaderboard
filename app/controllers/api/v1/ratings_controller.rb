# frozen_string_literal: true

module Api
  module V1
    class RatingsController < ApplicationController
      def index
        ratings = Rating.all
        render json: ratings, status: 200
      end

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      def create
        # validates that user_id, post_id exists
        @user = User.find_by_id(rating_params[:user_id])
        @post = Post.find_by_id(rating_params[:post_id])
        @rating = Rating.new(
          user_id: rating_params[:user_id],
          post_id: rating_params[:post_id],
          value: rating_params[:value]
        )

        if @rating.save
          render json: [@rating, @post.ratings.average(:value)], status: 200
        else
          render json: { error: @rating.errors.full_messages }
        end
      end
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize

      private

      def rating_params
        params.require(:rating).permit(%i[
                                         user_id
                                         post_id
                                         value
                                       ])
      end
    end
  end
end
