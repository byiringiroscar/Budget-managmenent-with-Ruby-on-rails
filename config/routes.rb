Rails.application.routes.draw do
  devise_for :users
  unauthenticated :user do
    root to: 'splash#index', as: :unauthenticated_root
  end

  authenticated :user do
    resources :categories do
      resources :spends
    end
    root to: 'categories#index', as: :authenticated_root
  end

end
