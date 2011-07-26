IsotopeRails3::Application.routes.draw do
  root :to => 'home#index'

  devise_for :users, :path => '/', :path_names => { :sign_in => 'login', :sign_out => 'logout' }

  match '/about' => 'users#index', :as => :about_index
  match '/about/alumni' => 'users#alumni', :as => :about_alumni
  match '/about/:id' => 'users#show', :as => :about
  resources :users do
    member do
      put :change_password
    end
  end
  resources :posts, :path => :blog
  resources :contact

  match '/services' => 'services#index'
  match '/services/phasezero' => 'services#phasezero'
  match '/services/socialmedia' => 'services#socialmedia'
  match '/services/ecommerce' => 'services#ecommerce'
  match '/services/mlm' => 'services#mlm'
  match '/services/financial' => 'services#financial'
  match '/services/insurance' => 'services#insurance'
  match '/services/mobile' => 'services#mobile'
  match '/services/saas' => 'services#saas'

  match '/community' => 'community#index'
  match '/community/xrono' => 'community#xrono'
  match '/community/rubyham' => 'community#rubyham'
  match '/community/state_machine_audits' => 'community#state_machine_audits'
  match '/community/techbirmingham' => 'community#techbirmingham'
  match '/community/contract_acceptance_framework' => 'community#contract_acceptance_framework'
  
  match '/home/contact' => 'home#contact'
  match '/home/payments' => 'home#payments'
  match '/home/careers' => 'home#careers'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
