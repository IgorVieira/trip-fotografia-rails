Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  

  resources :articles
  resources :projects
  resources :contacts, only:[:new, :create]

  root "welcome#index"

end
