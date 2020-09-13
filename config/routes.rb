Rails.application.routes.draw do
    root 'game#index'
    get 'game/start'
    get 'game/set_answer'
    get 'game/view_right_answer'
    get 'game/finish'

    resources :questions do
        # resources :answers
    end

    resources :answers

    # get 'questions/destroy'

    resources :application, only: [:new, :create]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'welcome', to: 'sessions#welcome'

end
