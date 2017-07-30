class HomeController < ApplicationController

  def index
    @emissions = Emission.all.shuffle
    @last = Emission.all.order('date DESC').first
  end

  def chrono
    @emissions = Emission.all.order('date DESC')
    @last = @emissions.first
  end

  def sorted
    @emissions_sorted = Emission.all.order('date DESC')
  end

  def cul_rake
    system ('rake cul:xml_parser')
    redirect_to chrono_path
  end

  def cul_key (keyword)
    @cul = Emission.where('description LIKE ?', '%keyword%')
  end


end
