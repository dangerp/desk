module Desk
  class Error < StandardError

  end

  BadRequest = Class.new(Desk::Error)
  Unauthorized = Class.new(Desk::Error)
  NotFound = Class.new(Desk::Error)
  Forbidden = Class.new(Desk::Error)
  MethodNotAllowed = Class.new(Desk::Error)
  NotAcceptable = Class.new(Desk::Error)
  Conflict = Class.new(Desk::Error)
  UnsupportedMediaType = Class.new(Desk::Error)
  UnprocessableEntity = Class.new(Desk::Error)
  TooManyRequests = Class.new(Desk::Error)
  NotImplemented = Class.new(Desk::Error)
end