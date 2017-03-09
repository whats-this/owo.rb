require 'owo/err'
require 'uri'
require 'rest-client'

module OwO
  # List of methods representing endpoints in OwO's API
  module API
    UPLOAD_URL = "https://api.awau.moe/upload/pomf"
    SHORTEN_URL = "https://api.awau.moe/shorten/polr"

    module_function

    def request(type, *attributes)
      raw = RestClient.send(type, *attributes, :'User-Agent' => "OwO.rb (https://github.com/whats-this/owo.rb)")
      json = parse_json(raw);
      return json
    rescue RestClient::RequestEntityTooLarge
      raise OwO::Err::TooLarge, "Requested files are too large!"
    rescue RestClient::Unauthorized
      raise OwO::Err::BadToken, "Token is invalid!"
    rescue RestClient::BadRequest => e
      raw = e.response
      json = parse_json(raw)
      if json.is_a?(Hash)
        if json['description'] == 'too many files'
          raise OwO::Err::TooManyFiles, "You requested too many files!"
        end
      else
        if raw == 'invalid URL'
          raise OwO::Err::BadURL, "Your URL is invalid!"
        end
      end
      err = if json.is_a?(Hash)
              json['description']
            else
              raw
            end

      raise err
    rescue RestClient::InternalServerError
      raise OwO::Err::ServerFail, "Server Error!"
    rescue RuntimeError => e
      raise e
    end

    def parse_json(raw)
      JSON.parse(raw)
    rescue JSON::ParserError
      raw
    end

    def upload(opts, files)
      # "https://#{opts['u']}/" + 
      request(
        :post,
        "#{UPLOAD_URL}?key=#{opts['t']}",
        "files".to_sym() => files
      )
    end

    def shorten(opts, url)
      request(
        :get,
        "#{SHORTEN_URL}?action=shorten&url=#{URI.escape(url)}&key=#{opts['t']}"
      ).sub(/awau\.moe/, opts['s'])
    end
  end
end

# gem build owo.gemspec && gem install owo-1.0.0.gem && ruby test/upload.rb