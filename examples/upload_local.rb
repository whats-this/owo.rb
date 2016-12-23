require '../lib/owo-wrapper'


client = OwO::API.new
res = client.upload_local './example.jpg'
