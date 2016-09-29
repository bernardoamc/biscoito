require "biscoito/version"

module Biscoito
  class Application
    def call(env)
      [200, {"Content-Type" => "text/html"}, ["Biscoito is running!"]]
    end
  end
end
