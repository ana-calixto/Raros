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

#seed com sample de doenças raras
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

 