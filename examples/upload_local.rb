require '../lib/owo-wrapper'


client = OwO::API.new 'YOUR_TOKEN_HERE'
res = client.upload_local './example.jpg' #or an array, like ['./example.jpg']
puts res
