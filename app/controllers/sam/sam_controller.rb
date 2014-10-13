require_dependency "sam/application_controller"

module SAM
  class SAMController < SAM::ApplicationController

    before_filter :authorize

    def index
      render 'sam/layouts/application', :layout => false
    end

    def plugin
      render 'sam/layouts/application', :layout => false, :anchor => '/sam'
    end
  end
end
