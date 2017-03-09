Gem::Specification.new do |gem|
  gem.name          = 'owo'
  gem.version       = '1.1.1'
  gem.date          = '2016-03-08'
  gem.authors       = ['Snazzah']
  gem.email         = 'suggesttosnazzy@gmail.com'
  gem.summary       = %q{A gem that utilizes the OwO API.}
  gem.description   = %q{A gem that utilizes the OwO API.}
  gem.files         = ["lib/owo.rb","lib/owo/err.rb","lib/owo/api.rb"]
  gem.homepage      = 'https://github.com/whats-this/owo.rb'
  gem.license       = 'MIT'

  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'pry'

  gem.add_dependency 'rest-client'
end
