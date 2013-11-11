require 'desk/error'

module Desk
  module Response
    class ErrorHandling < Faraday::Response::Middleware

      ERROR_TYPE = {
        400 => BadRequest,
        401 => Unauthorized,
        404 => NotFound,
        403 => Forbidden,
        405 => MethodNotAllowed,
        406 => NotAcceptable,
        409 => Conflict,
        415 => UnsupportedMediaType,
        422 => UnprocessableEntity,
        429 => TooManyRequests,
        501 => NotImplemented
      }

      def call(env)
        @app.call(env).on_complete do |finished_env|
          if finished_env[:status] >= 400
            raise ERROR_TYPE[finished_env[:status]], finished_env[:body]["message"] if ERROR_TYPE[finished_env[:status]]
          end
        end
      end
    end
  end
end