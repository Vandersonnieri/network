class User < ApplicationRecord
    attribute :password
    before_create :create_password_digest
    has_secure_password

    has_many :posts, dependent: :destroy
    validates :username, presence: true, length: { maximum: 50 }
    validates :password, presence: true, length: { maximum: 50 }

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def create_password_digest
        password_digest = User.digest(password)
    end
end
