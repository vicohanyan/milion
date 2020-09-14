Rails.application.routes.draw do
  devise_for :users
  resources :questions
  resources :users
    root 'game#index'
    get 'game/start'
    get 'game/set_answer'
    get 'game/view_right_answer'
    get 'game/finish'
    get 'game/statistic'

    resources :questions
    resources :answers


    resources :application, only: [:new, :create]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'welcome', to: 'sessions#welcome'



end
