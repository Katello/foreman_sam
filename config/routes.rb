Headpin::Engine.routes.draw do

  match '/:headpin_page/(*path)', :to => "headpin#index"
  match '/headpin/(*path)', :to => "headpin#index_ie"

end
