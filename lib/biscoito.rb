require "biscoito/version"
require "biscoito/controller"
require "biscoito/extensions"
require "biscoito/autoloading"
require "biscoito/router"

module Biscoito
  class Application
    def call(env)
      controller, action = get_route(env)
      Object.const_get(controller).new(env).public_send(action)
    end

    def routes(&block)
      @router ||= Router.new
      @router.instance_eval(&block)
    end

    def get_route(env)
      @router.fetch_controller_and_action(env['PATH_INFO'])
    end
  end
end
