module Amber::Operations
  class Contract
    def self.call(context)
      Contract.new(context)
    end

    def initialize(@context : HTTP::Server::Context)
    end

    def call
    end

    def success?
      true
    end
  end
end
