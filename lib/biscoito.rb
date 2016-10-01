require "biscoito/version"
require "biscoito/controller"
require "biscoito/extensions"
require "biscoito/autoloading"

module Biscoito
  class Application
    def call(env)
      controller = MainController.new(env)
      [200, {"Content-Type" => "text/html"}, [controller.action]]
    end
  end
end
