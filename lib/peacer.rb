# frozen_string_literal: true

require_relative "peacer/version"
# require 'peacer/array'

module Peacer
  class Application
    def call(env)
      `echo debug > debug.txt`
      [200, { "Content-Type" => "text/html" }, ["Hello from Ruby on Peacer!"]]
    end
  end
end
