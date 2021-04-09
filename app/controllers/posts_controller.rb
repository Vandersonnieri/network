class PostsController < ApplicationController
    before_action :logged_in_user

    def index
        #render json: Post.limit(5)
        render json: Post.to_json(params[:page])
    end

    def create
        user = User.find_by(id: JSON.parse(request.body.read)['user_id'])
        micropost = user.posts.build(micropost_params) if user
        #binding.pry
        render json: Post.all if micropost.save
    end

    def micropost_params
        params.permit(:text)
    end
end

