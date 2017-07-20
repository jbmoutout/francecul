Rails.application.routes.draw do

  root 'home#index'

  get 'chrono', to: 'home#chrono'
end
