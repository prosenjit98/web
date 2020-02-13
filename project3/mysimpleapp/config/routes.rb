Rails.application.routes.draw do

  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/edit'
  # get 'posts/delete'
  # get 'messege_contents/index'
  # get 'messege_contents/show'
  # get 'messege_contents/new'
  # get 'messege_contents/edit'
  # get 'messege_contents/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/logout'
  resources :posts do
    member do
      get :delete
    end
    resources :messege_contents do
      member do
        get :delete
      end
    end
  end
 
  resources :messege_contents do
    member do
      get :delete
    end
  end
  resources :users do
    member do
      get :delete
    end
  end
end
