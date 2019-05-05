Rails.application.routes.draw do

  #Defines routes for home page and sets the root path
  get 'pages/home'
  root 'pages#home'

  #Defines routed for updating, viewing, and creating new users 
  get '/users' => 'pages#index'
  get '/user/:id/update' => 'user#update'
  patch '/user/:id/update' => 'user#update'
  post '/user/:id/update' => 'user#update'
  get '/user/:id/show' => 'user#show'
  post '/user/new' => 'user#new'

  #Defines routes for updating, showing, and creating new quizzes
  get '/quiz/:id/update' => 'quiz#update'
  patch '/quiz/:id/update' => 'quiz#update'
  post '/quiz/:id/update' => 'quiz#update'
  post '/quiz/new' => 'quiz#new'

  get '/quiz/:id/admin_update' => 'quiz#admin_update'
  patch '/quiz/:id/admin_update' => 'quiz#admin_update'
  post '/quiz/:id/admin_update' => 'quiz#admin_update'

  
  #Defines resources required for routes
  resources :user, :quiz

  devise_scope :user do
    #Created routes for logging in and signing out
    get "/users/sign_out" => "devise/sessions#destroy"
    get "users/sign_up" => "devise/registrations#new"
  end

  #Routes for Admininstrator Views
  get '/admin_panel' => 'admin#admin_panel' 
  get '/admin_panel_users' => 'admin#admin_panel_users'
  get '/admin_panel_quizzes' => 'admin#admin_panel_quizzes'
  get '/admin_panel_logs' => 'admin#admin_panel_logs'


  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
