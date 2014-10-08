module Headpin
  class Engine < ::Rails::Engine
    isolate_namespace Headpin

    initializer 'headpin.mount_engine', :after => :build_middleware_stack do |app|
      app.routes_reloader.paths << "#{Headpin::Engine.root}/config/mount_engine.rb"
    end

    initializer "headpin.paths" do |app|
      app.routes_reloader.paths.unshift("#{Headpin::Engine.root}/config/routes/api/headpin.rb")
      app.routes_reloader.paths.unshift("#{Headpin::Engine.root}/config/overrides.rb")
    end

    config.to_prepare do
      #::Api::V2::<EXAMPLE>Controller.send :include, Headpin::Concerns::<EXAMPLE>ControllerExtensions
    end

    initializer 'headpin.register_plugin', :after => :finisher_hook do
      require 'headpin/plugin'
      require 'headpin/permissions'
    end

  end
end
