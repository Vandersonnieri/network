class PostsController < ApplicationController
    before_action :logged_in_user

    def index
        render json: Post.to_json(params[:page])
    end

    def create
        body = JSON.parse(request.body.read)
        user = User.find_by(id: body["user_id"])
        micropost = user.posts.build(text:body["text"])
        if micropost.save
            render json: Post.serialize(micropost)
        else
            render json: {message: {error: ["Something went wrong. Try again"]}}
        end
    end
end

