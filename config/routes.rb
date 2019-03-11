Rails.application.routes.draw do
  devise_for :users
  root 'application#hello'
  get  'products/new'  =>  'products#new'
end
