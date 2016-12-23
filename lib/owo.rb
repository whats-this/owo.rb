require 'curb'
require 'crack/json'

module OwO

    UPLOAD_PATH = "http://api.awau.moe/upload/pomf"

    class API

        def upload_local local
            c = Curl::Easy.new(UPLOAD_PATH)
            c.multipart_form_post = true
            c.http_post(Curl::PostField.file('image', local))
            response = Crack::JSON.parse c.body_str
            puts response
        end
    end
end
