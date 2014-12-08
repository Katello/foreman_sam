module ForemanSAM
  class Engine < ::Rails::Engine
    isolate_namespace ForemanSAM

    initializer 'foreman_sam.mount_engine', :after => :build_middleware_stack do |app|
      app.routes_reloader.paths << "#{ForemanSAM::Engine.root}/config/mount_engine.rb"
    end

    initializer 'foreman_sam.paths' do |app|
      app.routes_reloader.paths.unshift("#{ForemanSAM::Engine.root}/config/routes/api/foreman_sam.rb")
      app.routes_reloader.paths.unshift("#{ForemanSAM::Engine.root}/config/routes/overrides.rb")
    end

    config.to_prepare do
      ::SettingsController.send :include, ForemanSAM::Concerns::SettingsControllerExtensions
    end

    initializer 'foreman_sam.register_plugin', :after => :finisher_hook do
      require 'foreman_sam/plugin'
      require 'foreman_sam/permissions'
    end
  end
end
