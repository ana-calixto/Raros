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
# u = User.last

# puts 'Creating topics...'

# Topic.create!({
#   title: "Rare Disease 1",
#   user: u
# })

# puts 'Finished!'

diseases = [{"nome" => "HPN", "cid_10": "G91.8"},{"nome" => "Doença de Crohn", "cid_10": "K50.0"}, {"nome" => "Pseudotumor Cerebral", "cid_10": "G93.2"}, {"nome" => "Delírio de Capgras", "cid_10": "F22.0"}, {"nome" => "Sindrome de Chiari", "cid_10": "Q07.7"}, {"nome" => "Doença de Meniere", "cid_10": "G90.0"}, {"nome" => "Doença de Tangier", "cid_10": "F22.0"}]
diseases.each do |disease|
    d = Disease.new(
      name: disease["nome"],
      cid_10: disease["codigo"],
    )
    d.save!
  end

 