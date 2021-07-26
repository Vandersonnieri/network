class LikesController < ApplicationController
    before_action :liked, only: [:create, :destroy]
    def create
        post = Post.find_by(id: params[:post_id])
        post.likes.create(user_id: @body['user_id'])
        render json: {"likes_count": post.likes.length}
    end

    def destroy
        post = Post.find_by(id: params[:post_id])
        like =  post.likes.find_by(user_id: @body['user_id'])
        like.destroy!
        render json: {"likes_count": post.likes.length}
    end

    private
    def liked
        @body = JSON.parse(request.body.read)
        # if Like.where(user_id: @body['user_id'], post_id: params[:post_id]).exists?
        #     render json: {"message": "already liked"}
        # end
    end
end
