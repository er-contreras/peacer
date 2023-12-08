# frozen_string_literal: true

require_relative "peacer/version"
require 'peacer/routing'
require 'peacer/util'
require 'peacer/dependencies'
require 'peacer/controller'
require 'peacer/file_model'

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

  def self.framework_root
    __dir__
  end
end
