module SAM
  class Engine < ::Rails::Engine
    isolate_namespace SAM

    initializer 'sam.mount_engine', :after => :build_middleware_stack do |app|
      app.routes_reloader.paths << "#{SAM::Engine.root}/config/mount_engine.rb"
    end

    initializer 'sam.paths' do |app|
      app.routes_reloader.paths.unshift("#{SAM::Engine.root}/config/routes/api/sam.rb")
      app.routes_reloader.paths.unshift("#{SAM::Engine.root}/config/routes/overrides.rb")
    end

    config.to_prepare do
      #::Api::V2::<EXAMPLE>Controller.send :include, SAM::Concerns::<EXAMPLE>ControllerExtensions
      ::SettingsController.send :include, SAM::Concerns::SettingsControllerExtensions
    end

    initializer 'sam.register_plugin', :after => :finisher_hook do
      require 'sam/plugin'
      require 'sam/permissions'
    end
  end
end
