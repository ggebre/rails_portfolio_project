Rails.application.routes.draw do
  
  get '/auth/google_oauth2/callback' => 'sessions#create' 


  get 'sessions/login'
  get 'sessions/logout', to: 'sessions#destroy'
  get '/nurse_admins/nurse_assignment', to: 'nurse_admins#nurse_assignments', :as => "nurse_assignment"
  post '/nurse_admins/nurse_assignment', to: 'nurse_admins#assignments'
  
  get '/latest_prescription', to: 'nurses#latest'
  resources :sessions, only: :create 
  resources :nurse_admins, only: [:show, :index, :create, :new]
  resources :users, only: [:index, :new, :create]

  resources :patients, except: [:destroy] do 
    resources :prescriptions, only: [:index, :show, :new, :create]
    resources :vitals, only: [:index, :show, :new, :create]
    resources :body_masses, only: [:index, :show, :new, :create]
  end
  resources :nurses, except: [:destroy] do 
    resources :patients, only: [:index, :show, :new, :edit] 
  end
  
  resources :prescriptions, except: [:destroy]
  resources :vitals, except: [:destroy]
  resources :body_masses, except: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
