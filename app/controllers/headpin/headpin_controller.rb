require_dependency "headpin/application_controller"

module Headpin
  class HeadpinController < Headpin::ApplicationController

    before_filter :authorize

    def index
      render 'headpin/layouts/application', :layout => false
    end

    def plugin
      render 'headpin/layouts/application', :layout => false, :anchor => '/headpin'
    end
  end
end
