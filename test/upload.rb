puts "\n--------- OwO.rb Test ---------\nTHIS MUST BE RUN IN THE TEST FOLDER\nLoading Module..."
require 'owo'
owo = OwO::WhatsThis.new('TOKEN')
puts 'Requesting Single...'
puts "Single: #{owo.upload('example.png')}"
puts 'Requesting Multi...'
v = owo.upload(['example.png', 'example2.png'])
puts "Multi: #{v[0]} | #{v[1]}"
puts "----------- Finish -----------\n"
