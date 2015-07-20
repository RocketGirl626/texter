Rails.application.routes.draw do
  root to: 'contacts#index'
  resources :contacts do
    resources :messages, :only => [:index, :new, :create, :show]
  end
end
