class HomeController < ApplicationController

  def index
    @emissions = Emission.all.shuffle
  end
end
