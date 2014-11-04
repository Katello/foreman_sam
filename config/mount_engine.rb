Foreman::Application.routes.draw do
  mount SAM::Engine, :at => '/', :as => 'sam'
end
