class ApplicationController < ActionController::Base
  before_filter :redirect_to_https
  include Response
  protect_from_forgery with: :exception
end
