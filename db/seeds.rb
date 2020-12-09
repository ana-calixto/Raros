require "json"
require "rest-client"
require "faker"

#Seed para gerar todas as doenças cadastradas pelo CID-10
#(manter comentado enquanto não fizer filtro ** São 15 mil doenças **)
# response = RestClient.get("http://cid10-api.herokuapp.com/cid10")
# diseases = JSON.parse(response)
#diseases.each do |disease|
#  d = Disease.new(
#     name: disease["nome"],
#     cid_10: disease["codigo"],
#   )
#   d.save!
# end

#seed with rare diseases sample. Comment until line 55 if you run this seed more than once.

puts "Creating Diseases"
diseases = [
{"nome" => "HPN", "cid_10" => "G91.8"},
{"nome" => "Doença de Crohn", "cid_10" => "K50.0"},
{"nome" => "Pseudotumor Cerebral", "cid_10" => "G93.2"},
{"nome" => "Delírio de Capgras", "cid_10"=> "F22.0"},
{"nome" => "Sindrome de Chiari", "cid_10" => "Q07.7"},
{"nome" => "Doença de Meniere", "cid_10" => "G90.0"},
{"nome" => "Doença de Tangier", "cid_10" => "F22.0"},
{"nome" => "Doença de Hodgkin", "cid_10" => "C81.0"},
{"nome" => "Doença de Addison", "cid_10" => "E27.1"},
{"nome" => "Síndrome do anticorpo antifosfolipídeo", "cid_10" => "D68.8"},
{"nome" => "Ataxia de Friedreich", "cid_10" => "G11.1"},
{"nome" => "Síndrome de Asperger", "cid_10" => "F84.5"},
{"nome" => "Atrofia muscular espinhal", "cid_10" => "G12.0"},
{"nome" => "Doença celíaca", "cid_10" => "K90.0"},
{"nome" => "Síndrome de Cockayne", "cid_10" => "G30.9"},
{"nome" => "Anemia falciforme", "cid_10" => "D57.0"},
{"nome" => "Esclerose Múltipla", "cid_10" => "G35.0"},
{"nome" => "Hiperidrose", "cid_10" => "R61.0"},
{"nome" => "Síndrome de Kawasaki", "cid_10" => "M30.3"},
{"nome" => "Síndrome de Larsen", "cid_10" => "M41.2"},
{"nome" => "Síndrome de Leigh", "cid_10" => "G31.8"},
{"nome" => "Lúpus eritematoso", "cid_10" => "L93.0"},
{"nome" => "Doença de Lyme", "cid_10" => "A69.2"},
{"nome" => "Miastenia grave", "cid_10" => "G70.0"},
{"nome" => "Síndrome de Pfeiffer", "cid_10" => "G32.0"},
{"nome" => "Craniossinostose", "cid_10" => "Q75.0"},
{"nome" => "Sindactilia", "cid_10" => "F68.1"},
]
diseases.each do |disease|
    d = Disease.new(
      name: disease["nome"],
      cid_10: disease["cid_10"],
    )
    d.save!
  end
 puts "Diseases created!"

 #create locations
 locations = ["São Paulo", 
 "Boituva", 
 "Osasco", 
 "Barueri", 
 "Franco da Rocha", 
 "Mairinque", 
 "Mongagua", 
 "Salvador", 
 "Campo Maior", 
 "Fortaleza", 
 "Curitiba", 
 "São José dos Pinhais"]
 puts "Creating users..."

 #Create users with standard avatar photo.
30.times do
  user = User.create(
      username: Faker::Name.initials,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: "123456",
      password_confirmation: "123456",
      birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      address: locations.sample,
      disease_id: rand(1..26),
    )
  # standard avatar photo for each user:
  user.photo.attach(io: File.open('app/assets/images/avatar.jpg'), filename: 'avatar.jpg')
  user.save!
  
end

user = User.create(
  username: "marina",
  first_name: "Marina",
  last_name: "Santos",
  email: "marinasantos@email.com",
  password: "123456",
  password_confirmation: "123456",
  birth_date: Faker::Date.birthday(min_age: 18, max_age: 22),
  address: locations.sample,
  disease_id: 9,
)
user.photo.attach(io: File.open('app/assets/images/marina.jpg'), filename: 'marina.jpg')
user.save!

user = User.create(
  username: "roberto",
  first_name: "Roberto",
  last_name: "Barros",
  email: "robertobarros@email.com",
  password: "123456",
  password_confirmation: "123456",
  birth_date: Faker::Date.birthday(min_age: 28, max_age: 45),
  address: locations.sample,
  disease_id: 9,
)
user.photo.attach(io: File.open('app/assets/images/roberto.jpg'), filename: 'roberto.jpg')
user.save!

topic = Topic.create(
  title: "Tratamento em SP"
  content: "Gostaria de saber se alguém conhece algum tratamento pelo SUS para Doença de Addison"
  user_id: 2
)
topic.save!

topic = Topic.create(
  title: "Artigo"
  content: "Achei esse artigo bem interessante: https://www.uol.com.br/vivabem/colunas/paola-machado/2020/11/18/desequilibrio-eletrolitico-saiba-o-que-e.htm"
  user_id: 2
)
topic.save!

puts "Users created!"
