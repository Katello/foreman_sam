ForemanSAM::Engine.routes.draw do

  match '/:sam_page/(*path)', :to => "foreman_sam#index"
  match '/sam/(*path)', :to => "foreman_sam#index_ie"

end
