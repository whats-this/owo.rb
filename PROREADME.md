# owo.rb

A wrapper written inside of Ruby that allows for you to upload files to the owo.whats-th.is service, however currently lacking the feature in order to shorten URL(s). Supported Ruby 1.9, however use in the latest version of Ruby is recommended (2.0+).

# Todo

* Add `rakefile`
* Add `gemfile`
* Add Remote Uploading
* Add URL Shortener

# Examples

**Image Uploading**

```ruby

client = OwO::API.new 'YOUR_TOKEN_HERE'
res = client.upload_local ['./example.png', './example_2.png']

```

# Contribute

1. Fork repo.
2. Edit code.
3. Make a PR.
4. Submit said PR.

# License

A copy of the MIT license can be found in `LICENSE.md`.