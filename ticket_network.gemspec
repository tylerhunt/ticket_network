Gem::Specification.new do |gem|
  gem.name    = 'ticket_network'
  gem.version = '0.0.1'
  gem.summary = 'An interface library for the Ticket Network web service.'

  gem.files = Dir['lib/**/*']
  gem.add_dependency 'activesupport', '>= 3.0.0.beta4'
  gem.add_dependency 'curb', '0.7.6'
  gem.add_dependency 'sax-machine', '0.0.15'
end