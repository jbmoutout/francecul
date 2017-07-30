Rails.application.routes.draw do

  root 'home#index'

  get 'chrono', to: 'home#chrono'
  get 'cul_rake', to: 'home#cul_rake'

  get 'emissions', to: "emissions#index"
  get 'emissions_count', to: "emissions#count"

end
