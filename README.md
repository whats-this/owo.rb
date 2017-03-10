[![Gem Version](https://img.shields.io/gem/v/owo.svg)]()
[![Gem Downloads](https://img.shields.io/gem/dt/owo.svg)]() [![Travis](https://img.shields.io/travis/SnazzyPine25/owo.rb/master.svg)]()
[![Inline docs](http://inch-ci.org/github/SnazzyPine25/owo.rb.svg?branch=master&style=shields)](http://inch-ci.org/github/SnazzyPine25/owo.rb)
[![Docs](https://img.shields.io/badge/view-docs-FACE00.svg)](http://www.rubydoc.info/gems/owo/OwO/WhatsThis)
# ![OwO](https://github.com/SnazzyPine25/owo.rb/raw/master/test/example2.png)
A wrapper gem for the OwO API.

## Dependencies
* [rest-client](https://github.com/rest-client/rest-client)

## Examples
```ruby
require 'owo'
owo = OwO::WhatsThis.new('TOKEN', upload_url: "owo.whats-th.is", shorten_url: "uwu.whats-th.is")
```
Shortening URLs
```ruby
owo.shorten("https://whats-th.is") # "http://uwu.whats-th.is/d263a4"
owo.shorten(["https://google.com", "https://youtube.com"]) # ["http://uwu.whats-th.is/13xd1", "http://uwu.whats-th.is/cqwec"]
```
Uploading Files
```ruby
# Due note that when not using the absolute path, the path set will be where the process started, NOT where the ruby gem path.
owo.upload("./test/example.png") # "https://owo.whats-th.is/4463fc.png"
owo.upload(File.new(File.apsolute_path("./test/example.png"))) # "https://owo.whats-th.is/aa1nsa.png"
owo.upload([File.new(File.apsolute_path("./test/example2.png")), "./test/example2.png"]) # ["http://owo.whats-th.is/n1nsua.png", "http://owo.whats-th.is/nd91ka.png"]
```
