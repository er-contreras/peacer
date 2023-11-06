# frozen_string_literal: true

require_relative "peacer/version"
# require 'peacer/array'
require 'peacer/routing'

module Peacer
  class Application
    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [404, { "Content-Type" => "text/html" }, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        @text = controller.send(act)
      rescue Exception => e
        [500, { "Content-Type" => "text/html" }, ["Something went wrong!"]]
      end
      # `echo debug > debug.txt`

      [200, { "Content-Type" => "text/html" }, [@text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
