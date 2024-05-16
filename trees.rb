require 'net/http'
require 'json'
require 'pp'
 
url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?%24limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
tree_types = JSON.parse(response) # Convert JSON data into Ruby data.

ash_tree_count = 0

tree_types.each do |tree|
    common_name = tree["common_name"]
    if common_name.include?("ash")
        ash_tree_count += 1
    end
end

puts "There are #{ash_tree_count} Ash trees in the dataset."