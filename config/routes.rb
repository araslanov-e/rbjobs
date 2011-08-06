Rbjobs::Application.routes.draw do
  resources :vacancies
  root :to => 'homepage#index'
end
