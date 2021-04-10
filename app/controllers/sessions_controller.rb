class SessionsController < ApplicationController
    def create
        body = JSON.parse(request.body.read)
        user = User.find_by(username: body['username'])
        if user && user.authenticate(body['password'])
            session[:user_id] = user[:id]
            render json: user
        else
            render json: {message: {error: ["Invalid user or password"]}}
        end
    end

    def destroy
        log_out if logged_in?
        render json: {message: "logged out"}
    end
end
