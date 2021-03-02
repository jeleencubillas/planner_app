Rails.application.routes.draw do

  root "categories#index"

  devise_for :users
  
  resources :categories, shallow: true do 
    resources :tasks
  end

  get '/today' => 'tasks#today', as: :tasks_today

end
