# 
#                               __    
# .-----.--.--.--.-----.  .----|  |--.
# |  _  |  |  |  |  _  |__|   _|  _  |
# |_____|________|_____|__|__| |_____|
#                                     
# Upload Examples

# ############################################################

require '../lib/owo-wrapper'
client = OwO::API.new 'YOUR_TOKEN_HERE'

# ############################################################

# Select the file in which you want to upload.
res = client.upload_local './example.png' 

# Can also be in the form of an array.
res = client.upload_local ['./example.png']

# Displays the output in the console.
puts res
