Foreman::Application.routes.draw do

  scope :sam, :module => :sam do
    match '/sam' => 'sam#plugin', :via => :get
  end

end
