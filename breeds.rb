require 'net/http'
require 'json'
require 'pp'
 
url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response) # Convert JSON data into Ruby data.
# pp dog_breeds # pp stands for pretty print.

dog_breeds['message'].each do |breed, sub_breeds|
    if sub_breeds.empty?
        puts "* #{breed.capitalize}"
    else
        puts "* #{breed.capitalize}"
        sub_breeds.each do |sub_breed|
            puts "  * #{sub_breed.capitalize}"
        end
    end
end