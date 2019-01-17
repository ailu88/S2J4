require_relative '../lib/mairies'

describe "get_townhall_urls" do
	it "should not be nil" do 
	expect(get_townhall_urls).not_to be_nil
	end 
	it "should return an array" do 
	expect(get_townhall_urls).to be_an_instance_of(Array)
	end 
end

describe "get_townhall_email" do
	it "should not be nil" do 
	expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).not_to be_nil
	end 
	it "returns the right email" do 
	expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq ("mairie.avernes@orange.fr")
	end 
end

describe "get_townhall_name" do
	it "should not be nil" do 
	expect(get_townhall_name("https://www.annuaire-des-mairies.com/95/avernes.html")).not_to be_nil
	end 
	it "returns the right name" do 
	expect(get_townhall_name("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq ("Avernes")
	end
	it "returns the right name" do 
	expect(get_townhall_name("https://www.annuaire-des-mairies.com/95/arnouville-les-gonesse.html")).to eq ("Arnouville-les-Gonesse")
	end 
end

describe "scrapping_townhalls_email" do
	it "should not be nil" do 
	expect(scrapping_townhalls_email).not_to be_nil
	end 
	it "should return an array" do 
	expect(scrapping_townhalls_email).to be_an_instance_of(Array)
	end 
	it "returns the right email adress for the right townhall" do 
	expect(scrapping_townhalls_email).to include({"Avernes" => "mairie.avernes@orange.fr"})
	end 
end