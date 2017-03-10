puts "\n--------- OwO.rb Test ---------\nLoading Module..."
require 'owo'
owo = OwO::WhatsThis.new('TOKEN')
puts 'Requesting Single...'
puts "Single: #{owo.shorten('https://whats-th.is')}"
puts 'Requesting Multi...'
v = owo.shorten(['http://discord.cards', 'https://whats-th.is'])
puts "Multi: #{v[0]} | #{v[1]}"
puts "----------- Finish -----------\n"
