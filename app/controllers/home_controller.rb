class HomeController < ApplicationController

  def index
    @emissions = Emission.all.shuffle
  end

  def chrono
    @emissions = Emission.all.order('date DESC')
  end

end
