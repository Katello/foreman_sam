Foreman::Application.routes.draw do
  mount ForemanSAM::Engine, :at => '/', :as => 'sam'
end
