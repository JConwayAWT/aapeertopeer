Rails.application.routes.draw do
  resources :tutor_applications

  resources :session_reviews

  resources :requests

  resources :consuming_enrollments

  resources :providing_enrollments

  resources :subjects

  resources :statics

  devise_for :users, controllers: {registrations: "registrations"}
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'statics#index'

  match '/auto_enroll', to: 'subjects#auto_enroll', via: :get
  match '/auto_enroll_update', to: 'subjects#update_auto_enroll', via: :post

  match '/remove_enrollment', to: 'subjects#remove_enrollment', via: :get
  match '/remove_enrollment_update', to: 'subjects#remove_enrollment_update', via: :post

  match '/find_tutors', to: 'statics#find_tutors', via: :get
  match '/list_tutors', to: 'statics#list_tutors', via: :post

  match '/generate_request/:tutor_id/:subject_id', to: 'requests#generate_request', via: :get
  match '/send_request', to: 'requests#send_request', via: :post
  match '/request_response/:id', to: 'requests#respond', via: :get
  match '/update_response', to: 'requests#update_response', via: :post

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
