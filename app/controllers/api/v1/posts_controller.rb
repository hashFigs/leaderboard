class Api::V1::PostsController < ApplicationController
  
  def index
   posts = Post.all
   render json: posts, status: 200
  end  


  def create
    
    @user = User.find_by(login: post_params[:login])
   
    if @user 

      @post =Post.new(
        title: post_params[:title],
        body: post_params[:body],
        user_id: @user.id,
        ip: post_params[:ip]
      )

    else
      @user = User.create(login: post_params[:login])
      @post =Post.new(
        title: post_params[:title],
        body: post_params[:body],
        user_id: @user.id,
        ip: post_params[:ip]
      )
    end 

    if @post.save 
      render json: [@user, @post], status: 200
    else
      render json: {error: "Error creating user"}
    end

  end

  private
  def post_params
    params.require(:post).permit([
      :title,
      :body,
      :login,
      :ip
    ]) 
    end  

end
