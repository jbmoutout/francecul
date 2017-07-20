class HomeController < ApplicationController

  def index
    @emissions = Emission.all.shuffle
  end
  helper_method :reloader
end
