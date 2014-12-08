Foreman::Application.routes.draw do

  scope :foreman_sam, :module => :foreman_sam do
    match '/sam' => 'foreman_sam#plugin', :via => :get
  end

end
