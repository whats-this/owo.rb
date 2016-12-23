require 'curb'
require 'crack/json'

<<-DOC

  @param {module} OwO: the module containing a class
  @param {class} API: contains methods
  @param {string} auth_key: an instance variable
  @param {string} UPLOAD_PATH: the path to POST files to
  $param {string} RESPONSE_PATH: the path to prepend to the file URL
  @param {string/array} local: the string/array of local file(s)
  @returns {array} files: the array of returned files

DOC


module OwO

    UPLOAD_PATH = "http://api.awau.moe/upload/pomf" #HTTP until Dean fixes SSL
    RESPONSE_PATH = "https://owo.whats-th.is/"

    class API

        def initialize auth_key
            @auth_key = auth_key
        end

        def upload_local local
            c = Curl::Easy.new(UPLOAD_PATH)
            c.multipart_form_post = true
            c.headers['Authorization'] = @auth_key
            c.http_post(Curl::PostField.file('files[]', local))
            response = Crack::JSON.parse c.body_str
            f = response['files']
            files = Array.new
            f.each do |file|
                url = RESPONSE_PATH + file['url']
                files.push({'name': file['name'], 'url': url})
            end
            files
        end
    end
end
