Rails.application.routes.draw do
  resources :grievances do
   resources :pipelines, except: [:index, :show] do
    resources :items, except: [:index, :show]
   end 
  end 
  resources :events
  resources :calendars
  devise_for :users 
  resources :users, only:[:index, :edit, :show, :update]
  resources :offices
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
