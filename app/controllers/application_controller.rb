class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    require 'pry-byebug'
    require 'json'
    include SessionsHelper
end
