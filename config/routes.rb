Rails.application.routes.draw do
  get 'pay_slips/show'
  get 'pay_slips/new'
  get 'pay_slips/edit'
  get 'salaries/index'
  get 'salaries/show'
  get 'salaries/new'
  get 'salaries/edit'
  devise_for :users
  root to: 'pages#home'
  # resources :pages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
