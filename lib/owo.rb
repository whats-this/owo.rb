require 'owo/err'
require 'owo/api'
require 'rest-client'

# OwO base module
module OwO
  # The main module for interaction
  class WhatsThis
    # The token to the module
    attr_accessor :token

    # The domain to use when returning upload URLs
    attr_accessor :upload_url

    # The domain to use when returning shortener URLs
    attr_accessor :shorten_url

    def initialize(token, upload_url: 'owo.whats-th.is', shorten_url: 'uwu.whats-th.is')
      @token = token
      @upload_url = upload_url
      @shorten_url = shorten_url
    end

    def opts
      { 't' => @token, 'u' => @upload_url, 's' => @shorten_url }
    end

    # Upload a single file or multiple files to OwO.
    # @param files [File, String, Array<File, String>] Files to upload, can be either String or File
    # @return [String, Array<String>] Returns the URLs of the uploaded files
    def upload(files)
      ogfiles = files
      if !files.empty?
        if files.is_a?(String)
          files = [files]
        end
        files = files.map do |x|
          if x.is_a?(String)
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
              raise OwO::Err::FileError, "#{errstring} | #{e.class.name}"
            end
          else
            x
          end
        end
        result = OwO::API.upload(opts, files)
        result.shift
        result = result['files'].map do |x|
          "https://#{@upload_url}/#{x['url']}"
        end
        result = result[0] unless ogfiles.is_a?(Array)
        result
      else
        raise OwO::Err::NoContent, 'Theres no files provided!'
      end
    end

    # Shortens a link with OwO.
    # @param urls [String, Array<String>] URLs to sharten
    # @return [String, Array<String>] Returns the URLs of the shortened URLs
    def shorten(urls)
      if !urls.empty?
        if urls.is_a?(Array)
          urls.map { |x| OwO::API.shorten(opts, x) }
        else
          OwO::API.shorten(opts, urls)
        end
      else
        raise OwO::Err::NoContent, 'Theres no URL provided!'
      end
    end
  end
end
