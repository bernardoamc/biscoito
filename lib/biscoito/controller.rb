module Biscoito
  STATUS_CODES = {
    ok: 200,
    not_found: 400
  }

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(status_code_symbol, &block)
      status_code = STATUS_CODES.fetch(status_code_symbol, 500)
      [status_code, {"Content-Type" => "text/html"}, [block.call]]
    end
  end
end
