class EmissionsController < ApplicationController

  def index
    if params[:sorted] == "true"
      @emissions = Emission.all.order('date DESC').take(30)
    else
      @emissions = Emission.all.shuffle.take(30)
    end
    @last = Emission.all.order('date DESC').first
    json_response({emissions: @emissions, last: @last})
  end

  # def json_response
  #   super.merge('date' => self.date.strftime("%d %b. %Y"))
  # end

  def count
    @emissions_count = Emission.all.count
    json_response(@emissions_count)
  end

  def cul_rake
    system ('rake cul:xml_parser')
    redirect_to chrono_path
  end

  def cul_key (keyword)
    @cul = Emission.where('description LIKE ?', '%keyword%')
  end


end
