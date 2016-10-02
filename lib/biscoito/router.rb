module Biscoito
  class Router
    def initialize
      @routes = {}
    end

    def match(url, path)
      controller, action = path.split('#')
      controller = [controller.capitalize, 'Controller'].join
      @routes[url] = [controller, action]
    end

    def fetch_controller_and_action(route)
      @routes.fetch(route, ['StaticController', 'not_found'])
    end
  end
end
