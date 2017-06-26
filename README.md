# OwO.rb
[![Gem Version](https://img.shields.io/gem/v/owo.svg)]()
[![Gem Downloads](https://img.shields.io/gem/dt/owo.svg)]() [![Travis](https://img.shields.io/travis/SnazzyPine25/owo.rb/master.svg)]()
[![Inline docs](http://inch-ci.org/github/whats-this/owo.rb.svg?branch=master&style=shields)](http://inch-ci.org/github/whats-this/owo.rb)
[![Docs](https://img.shields.io/badge/view-docs-FACE00.svg)](http://www.rubydoc.info/gems/owo)

A wrapper gem for the OwO API.

## Dependencies
* [rest-client](https://github.com/rest-client/rest-client)

## Installation
It's simple as running:

    gem install owo

## Examples
```ruby
require 'owo'
owo = OwO::WhatsThis.new('TOKEN', url: 'owo.whats-th.is')
# You don't have to set the upload URL and the download URL as they are optional.
```
Shortening URLs
```ruby
owo.shorten('https://whats-th.is') # "http://owo.whats-th.is/d263a4"
owo.shorten(['https://google.com', 'https://youtube.com']) # ["http://owo.whats-th.is/13xd1", "http://owo.whats-th.is/cqwec"]
```
Uploading Files
```ruby
# Due note that when not using the absolute path, the path set will be where the process started, NOT where the ruby gem path.
owo.upload('./test/example.png') # "https://owo.whats-th.is/4463fc.png"
owo.upload(File.new(File.apsolute_path('./test/example.png'))) # "https://owo.whats-th.is/aa1nsa.png"
owo.upload([File.new(File.apsolute_path('./test/example2.png')), './test/example2.png']) # ["http://owo.whats-th.is/n1nsua.png", "http://owo.whats-th.is/nd91ka.png"]
```

# Contributing

Pull requests are accepted. Make sure you add test suites for new features and make sure the code passes the spec (so the build doesn't break) and also pass rubocop. Tests are automatically run when commits are made in a pull request.

# License

The contents of this repository are licensed under the MIT license. A copy of the MIT license can be found in [LICENSE.md](LICENSE.md).
