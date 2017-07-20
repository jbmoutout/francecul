class HomeController < ApplicationController

  def index
    @emissions = Emission.all.shuffle
  end

  def chrono
    @emissions = Emission.all.order('date DESC')
  end

  def cul_rake
    system ('rake cul:xml_parser')
    redirect_to chrono_path
  end

end
