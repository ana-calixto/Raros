require "json"
require "rest-client"
require "faker"

#Seed para gerar todas as doenças cadastradas pelo CID-10
# puts "creating diseases"
# response = RestClient.get("http://cid10-api.herokuapp.com/cid10")
# diseases = JSON.parse(response)

# diseases.each do |disease|
#   d = Disease.new(
#     name: disease["nome"],
#     cid_10: disease["codigo"],
#   )
#   d.save!
# end

# puts "finishing seed"
#______________________________________________________________

# u = User.create!(email: "a@bc.com", password: "123123")
u = User.last

puts 'Creating topics...'

Topic.create!({
  title: "Rare Disease 1",
  user: u
})

puts 'Finished!'
