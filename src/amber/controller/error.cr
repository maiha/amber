require "./base"

module Amber::Controller
  class Error < Base
    def initialize(@context : HTTP::Server::Context, @ex : Exception)
      super(@context)
      @context.response.content_type = content_type
    end

    def not_found
      response_format(@ex.message)
    end

    def internal_server_error
      response_format("ERROR: #{@ex.inspect_with_backtrace}")
    end

    def forbidden
      response_format(@ex.message)
    end

    private def content_type
      if context.request.headers["Accept"]?
        request.headers["Accept"].split(",").first
      else
        "text/html"
      end
    end

    private def response_format(message)
      case content_type
      when "application/json"
        {"error": message}.to_json
      when "text/html"
        "<html><body><pre>#{message}</pre></body></html>"
      else
        message
      end
    end
  end
end
