Foreman::Application.routes.draw do
  mount Headpin::Engine, :at => '/', :as => 'headpin'
end
