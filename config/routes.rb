Rails.application.routes.draw do
  devise_for :users
  # homepage default
  root to: 'pages#home'

  # path to month with date in the URL /salaries/1/pay_slips/1?start_date=2019-12-01
  get "/id:?start_date=:month", to: "pay_slips#show"

  # resources :pages

  resources :salaries, only: [:index, :show, :new, :create, :edit, :update] do
    resources :pay_slips do
      resources :days
    end
  end
end
