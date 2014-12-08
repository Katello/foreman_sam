require_dependency 'foreman_sam/application_controller'

module ForemanSAM
  class ForemanSAMController < ForemanSAM::ApplicationController
    before_filter :authorize

    def index
      render 'foreman_sam/layouts/application', :layout => false
    end

    def plugin
      render 'foreman_sam/layouts/application', :layout => false, :anchor => '/sam'
    end
  end
end
