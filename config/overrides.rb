Foreman::Application.routes.draw do

  scope :headpin, :module => :headpin do
    match '/headpin' => 'headpin#plugin', :via => :get
  end

end
