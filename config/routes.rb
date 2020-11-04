Rails.application.routes.draw do
  devise_for :citizens, path: 'citizens', controllers: { sessions: "citizens/sessions" }
  resources :grievances do
   resources :pipelines, except: [:index, :show] do
    resources :items, except: [:index, :show]
   end 
  end 
  resources :events
  resources :calendars
  devise_for :users, path: 'auth', controllers: { invitations: 'users_invitations' }
  resources :users
  resources :offices
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
