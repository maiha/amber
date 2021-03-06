require "./*"
require "../support/locale_formats"

# We are patching the String class and Number struct to extend the predicates
# available. This will allow to add friendlier methods for validation cases.
class String
  include Amber::Extensions::StringExtension
end

abstract struct Number
  include Amber::Extensions::NumberExtension
end

class HTTP::Server::Context
  include Amber::Extensions::HTTPServerContextExtension
end
