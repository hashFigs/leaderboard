# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all
        render json: posts, status: 200
      end

      def top
        @top_posts = Post.first.top_posts

        postswithratings = @top_posts.map { |post| [post, post.avg_rating] }
        render json: postswithratings, status: 200
      end

      # rubocop:disable Metrics/MethodLength
      # rubocop:disable Metrics/AbcSize
      def create
        @user = User.find_by(login: params[:login])

        if @user
          @post = Post.new(
            title: post_params[:title],
            body: post_params[:body],
            user_id: @user.id,
            ip: post_params[:ip]
          )
        else
          @user = User.create(login: params[:login])

          u = @user.save!

          @post = Post.new(
            title: post_params[:title],
            body: post_params[:body],
            user_id: u.id,
            ip: post_params[:ip]
          )
        end

        if @post.save
          render json: [@user, @post], status: 200
        else
          render json: { error: 'Error creating post' }
        end
      end
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize

      private

      def post_params
        params.require(:post).permit(%i[
                                       title
                                       body
                                       ip
                                     ])
      end
    end
  end
end
