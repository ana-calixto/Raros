require "json"
require "rest-client"

puts "creating diseases"
response = RestClient.get("http://cid10-api.herokuapp.com/cid10")
diseases = JSON.parse(response)

diseases.each do |disease|
  d = Disease.new(
    name: disease["nome"],
    cid_10: disease["codigo"],
  )
  d.save!
end

puts "finishing seed"
