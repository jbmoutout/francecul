Rails.application.routes.draw do

  root 'home#index'

  get 'chrono', to: 'home#chrono'
  get 'cul_rake', to: 'home#cul_rake'
  
end
