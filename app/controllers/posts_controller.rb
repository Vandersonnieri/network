class PostsController < ApplicationController
    # before_action :logged_in_user
    before_action :correct_user, only: [:update]

    def index
        render json: Post.to_json(params[:page])
    end

    def create
        body = JSON.parse(request.body.read)
        user = User.find_by(id: body["user_id"])
        post = user.posts.build(text:body["text"])
        if post.save
            render json: Post.serialize(post)
        else
            render json: @error_message
        end
    end

    def update
        if @body["text"].empty?
            render json: @error_message       
        elsif @post.update(text: @body["text"])
            render json: Post.serialize(@post)
        else
            render json: User.error_message
        end
    end

    private
    def correct_user
        @body = JSON.parse(request.body.read)
        user = User.find_by(id: @body['user_id'])
        @post = user.posts.find_by(id: params[:id])
        if @post.nil?
            render json: User.error_message
        end 
    end
end

