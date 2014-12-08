SAM::Engine.routes.draw do

  match '/:sam_page/(*path)', :to => 'sam#index'
  match '/sam/(*path)', :to => 'sam#index_ie'

end
