class UsersController < ApplicationController
    def create
        body = JSON.parse(request.body.read)
        user = User.create(username: body['username'], password: body['password'])
        if user.errors.none?
            session[:user_id] = user.id
            render json: user
        else
            render json: {message: user.errors.full_messages}
        end
    end
end
