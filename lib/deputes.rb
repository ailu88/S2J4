
require 'rubygems'
require 'nokogiri'   
require 'open-uri'


def get_representatives_urls	# creates an array with URLs of all towns from Dep 95

	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
	urls_raw = page.xpath('//*/tr/td/a/@href')

	$url_array = []
	urls_raw.each do |url|
	    $url_array << "https://www.nosdeputes.fr"+url
	    end
	return $url_array
end


def get_representative_email(representative_page_url)	# given a town's URL, returns its contact e-mail

	page = Nokogiri::HTML(open(representative_page_url))
	@rep_email = page.xpath("//*[@id='b1']/ul[2]/li[1]/ul/li[1]/a").text
	return @rep_email

end 


def get_representative_first_name(representative_page_url)	#given a town's URL, returns its name

	email = get_representative_email(representative_page_url)
	@rep_firstname = email.split('.')[0].capitalize
	return @rep_firstname
end 

def get_representative_last_name(representative_page_url)	#given a town's URL, returns its name

	email = get_representative_email(representative_page_url)
	@rep_lastname = email.split('.')[1].split('@')[0].capitalize
	return @rep_lastname
end 


def scrapping_representatives_email		# creates a hash with the town name associated with its email for all URLs of Dep 95.

	get_representatives_urls

	$email_list = []

		$url_array.each do |representative_page_url|
			hash = { 	"nom" => get_representative_last_name(representative_page_url),
						"prenom" => get_representative_first_name(representative_page_url),
						"email" => get_representative_email(representative_page_url)
					}
			$email_list << hash
		end

	return $email_list 
	puts $email_list
end 


scrapping_representatives_email



begin 								# Manage Exceptions
	scrapping_representatives_email
rescue => e 
	puts "Oups petite erreur mais c'est pas grave"
end 