require 'owo/err'
require 'owo/api'
require 'rest-client'

# OwO base module
module OwO
  # The main module for interaction
  class WhatsThis
    # @return [String] the token used for OwO.
    attr_accessor :token

    # @return [String] the domain to use when returning URLs.
    attr_accessor :url

    # @return [String] the url being used to use the OwO API.
    attr_accessor :api_url

    # Create a class to upload files and shorten URLs with OWO.
    # @param token [String] the token required to use OwO.
    # @param url [String] the domain to use when returning URLs.
    # @param api_url [String] the url to use when using the OwO API. (This requires https:// or http://)
    def initialize(token, url: 'owo.whats-th.is', api_url: 'https://api.awau.moe')
      @token = token
      @url = url
      @api_url = api_url

      raise OwO::Err::BadToken, 'Token is empty!' if token.empty?
      raise OwO::Err::BadToken, 'Input your OwO token to test the client.' if token == 'TOKEN'
    end

    # Upload a single file or multiple files to OwO.
    # @param files [File, String, Array<File, String>] Files to upload, can be either String or File
    # @return [String, Array<String>] Returns the URLs of the uploaded files
    def upload(*files)
      ogfiles = files
      files = files.flatten
      raise OwO::Err::NoContent, 'There is a empty string in your arguments!' if files.include? ''
      raise OwO::Err::NoContent, 'Theres no files provided!' if files.empty?
      files = files.map do |x|
        return x if x.respond_to? :read
        begin
          File.new(File.absolute_path(x), 'rb')
        rescue Errno::ENOENT, Errno::EACCES, Errno::ENAMETOOLONG => e
          errstring = 'Unknown'
          case e.class.name
          when 'Errno::ENOENT'
            errstring = 'File Not Found'
          when 'Errno::EACCES'
            errstring = 'Permission Denied'
          when 'Errno::ENAMETOOLONG'
            errstring = 'Name Too Long'
          end
          raise OwO::Err::FileError, "Error initializing file '${x}' | #{errstring} | #{e.class.name}"
        end
      end
      result = OwO::API.upload(opts, files)['files'].map { |x| "https://#{@url}/#{x['url']}" }
      result[0] if ogfiles.length == 1 || !ogfiles.first.is_a?(Array)
    end

    # Shortens a link with OwO.
    # @param urls [String, Array<String>] URLs to shorten
    # @return [String, Array<String>] Returns the URLs of the shortened URLs
    def shorten(*urls)
      urls = urls.flatten
      raise OwO::Err::NoContent, 'There is a empty string in your arguments!' if urls.include? ''
      raise OwO::Err::NoContent, 'Theres no URLs provided!' if urls.empty?
      result = urls.flatten.map { |x| OwO::API.shorten(opts, x) }
      result[0] if urls.length == 1 || !urls.first.is_a?(Array)
    end

    private

    def opts
      { 't' => @token, 'u' => @url, 'a' => @api_url }
    end
  end

  # Alias for the class {WhatsThis}
  Client = WhatsThis
end
