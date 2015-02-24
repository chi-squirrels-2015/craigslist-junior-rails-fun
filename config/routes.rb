Rails.application.routes.draw do
  get "/" => 'categories#index'

  resources :sessions, only: [:create, :new, :destroy]
  resources :users, only: [:create, :new, :edit, :show]

  resources :categories, only: [:index, :show] do
    # resources :posts
  end

  get "/categories/:category_id/posts" => 'posts#index', as: :category_posts

  post "/categories/:category_id/posts" => 'posts#create'

  get "/categories/:category_id/posts/new" => 'posts#new', as: :new_category_post

  get "/categories/:category_id/posts/:id/edit" => 'posts#new', as: :edit_category_post

  get "/categories/:category_id/posts/:id" => 'posts#show', as: :category_post

  patch "/categories/:category_id/posts/:id" => 'posts#update'

  put "/categories/:category_id/posts/:id" => 'posts#update'

  delete "/categories/:category_id/posts/:id" => 'posts#destroy'

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
