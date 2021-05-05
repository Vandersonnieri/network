class Post < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    validates :text, presence: true

    has_many :likes, dependent: :destroy

    def Post.to_json(page)
        posts = Post.paginate(page: page, per_page: 10).order('created_at DESC')
        posts.map { |post| post.as_json(only: ["user_id", "text", "updated_at", "id"])
            .merge(username: post.user.username, likes: post.likes.length) }
    end
    
    def Post.serialize(post)
        post.as_json(only: ["user_id", "text", "updated_at", "id"])
            .merge(username: post.user.username, likes: post.likes.length)
    end
end
