# 1.3.0.1
Fixed bug when uploading files

# 1.3.0
The `upload_url` and `shorten_url` parameters when initialising the client has now been compacted into [`url`](http://www.rubydoc.info/gems/owo/OwO/WhatsThis#url-instance_method) since OwO can now use any domain for both operations.

The API url is now configurable to comform with OwO library rules.

The user agent has been changed to comform with OwO library rules.

`OwO::Client` is now an alias of `OwO::WhatsThis`.

File errors now show the file that gave an error.

Add checks in client initialization if the token is empty or unaltered in tests.

Use better methods in [`WhatsThis#upload`](http://www.rubydoc.info/gems/owo/OwO/WhatsThis#upload-instance_method).

Allow using many parameters in [`WhatsThis#upload`](http://www.rubydoc.info/gems/owo/OwO/WhatsThis#upload-instance_method) and [`WhatsThis#shrten`](http://www.rubydoc.info/gems/owo/OwO/WhatsThis#shorten-instance_method).

Privatize methods only mean't for internal uses.

Document some undocumented methods.

# 1.0.0 - 1.2.2
Initial commit and bug fixes