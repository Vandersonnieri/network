class ApplicationController < ActionController::Base
    require 'pry-byebug'
    require 'json'
    include SessionsHelper

    protect_from_forgery with: :null_session
end
