require_relative '../lib/deputes'

describe "get_representatives_urls" do
	it "should not be nil" do 
	expect(get_representatives_urls).not_to be_nil
	end 
	it "should return an array" do 
	expect(get_representatives_urls).to be_an_instance_of(Array)
	end 
end

describe "get_representative_email" do
	it "should not be nil" do 
	expect(get_representative_email("https://www.nosdeputes.fr/jean-felix-acquaviva")).not_to be_nil
	end 
	it "returns the right email" do 
	expect(get_representative_email("https://www.nosdeputes.fr/jean-felix-acquaviva")).to eq ("jean-felix.acquaviva@assemblee-nationale.fr")
	end 
end

describe "get_representative_firstname" do
	it "should not be nil" do 
	expect(get_representative_firstname("https://www.nosdeputes.fr/jean-felix-acquaviva")).not_to be_nil
	end 
	it "returns the right name" do 
	expect(get_representative_firstname("https://www.nosdeputes.fr/jean-felix-acquaviva")).to eq ("Jean-Felix")
	end
	it "returns the right name" do 
	expect(get_representative_firstname("https://www.nosdeputes.fr/gregory-besson-moreau")).to eq ("Gregory")
	end 
end

describe "get_representative_lastname" do
	it "should not be nil" do 
	expect(get_representative_lastname("https://www.nosdeputes.fr/jean-felix-acquaviva")).not_to be_nil
	end 
	it "returns the right name" do 
	expect(get_representative_firstname("https://www.nosdeputes.fr/jean-felix-acquaviva")).to eq ("Acquaviva")
	end
	it "returns the right name" do 
	expect(get_representative_firstname("https://www.nosdeputes.fr/gregory-besson-moreau")).to eq ("Besson-Moreau")
	end 
end


describe "scrapping_representatives_email" do
	it "should not be nil" do 
	expect(scrapping_representatives_email).not_to be_nil
	end 
	it "should return an array" do 
	expect(scrapping_representatives_email).to be_an_instance_of(Array)
	end 
	it "returns the right email adress for the right townhall" do 
	expect(scrapping_representatives_email).to include({"nom" => "Acquaviva", "prenom" => "Jean-Felix", "email" => "jean-felix.acquaviva@assemblee-nationale.fr"})
	end 
end