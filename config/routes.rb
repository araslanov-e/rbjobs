Rbjobs::Application.routes.draw do
  resources :vacancies do
    get 'page/:page', :action => :index, :on => :collection
    put 'approve', :on => :member
  end
  root :to => 'vacancies#index'
end
