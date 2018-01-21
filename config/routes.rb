Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "homes#index"

devise_for :users, controllers: { sessions: 'users/sessions' }

resources :restaurants do
	member do
		get :delete
	end
end

end
