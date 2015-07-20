Rails.application.routes.draw do
  root to: 'contacts#index'
  resources :contacts do
    collection do
  		get 'all'
    end
    resources :messages, :only => [:index, :new, :create, :show]
  end
end
