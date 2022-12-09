# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: users, status: 200
      end

      def create
        user = User.new(
          login: user_params[:login]
        )

        if user.save
          render json: user, status: 200
        else
          render json: { error: 'Error creating user' }
        end
      end

      def ip_with_multiple_authors
        authors = User.all[1..10]
        ip = Post.all.first.ip

        render json: { "ip": ip, "authors": authors }, status: 200
      end

      private

      def user_params
        params.require(:user).permit([
                                       :login
                                     ])
      end
    end
  end
end
