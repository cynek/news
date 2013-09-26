News::Application.routes.draw do
  resources :cities

  resources :news_items

  root :to => "news_items#index"
end
