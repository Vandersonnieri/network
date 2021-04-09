class Post < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    validates :text, presence: true

    def Post.to_json(page)
        posts = Post.paginate(page: page, per_page: 10)
        posts.map { |post| post.as_json(only: ["user_id", "text", "updated_at", "id"])
            .merge(username: post.user.username) }
    end
end
