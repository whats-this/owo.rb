module OwO
  # Custom errors raised in various places
  module Err

    # Raised when a token is invalid or incorrect.
    class BadToken < RuntimeError
      # Default message for this exception
      def message
        'Token invalid'
      end
    end

    # Raised when too many files were uploaded.
    class TooManyFiles < RuntimeError
      # Default message for this exception
      def message
        'Too many files requested!'
      end
    end

    # Raised when no files were sent.
    class NoContent < RuntimeError
      # Default message for this exception
      def message
        'No content found!'
      end
    end

    # Raised when requested URL is bad.
    class BadURL < RuntimeError
      # Default message for this exception
      def message
        'Your URL is invalid!'
      end
    end

    # Raised when requested file(s) have too much bytes.
    class TooLarge < RuntimeError
      # Default message for this exception
      def message
        'File(s) are too large!'
      end
    end

    # Raised when a server error occurs
    class ServerFail < RuntimeError
      # Default message for this exception
      def message
        'Server tried to do a thing and borked!'
      end
    end

    # Raised when the error is unhandled
    class Unhandled < RuntimeError
      # Default message for this exception
      def message
        'Unhandled'
      end
    end
  end
end