
require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def scrap_cryptocurrencies
	# scrap data from CoinMarketCap

	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

	prices = page.xpath('//*/td[5]/a')
	currencies = page.xpath('//*/td[3]') 

	# create 2 arrays with values from scrapped data

	prices_array = []
	currencies_array = []

	prices.each do |price|
	      prices_array << price.text.delete("$").to_f
	      end

	currencies.each do |currency|
	      currencies_array << currency.text
	      end

	# create an array of mini-hashes, each hash associating currency x price

	@crypto_array = [] 
		
		for i in 0...currencies_array.length
			hash = { currencies_array[i] => prices_array[i] }
			@crypto_array << hash
		end 

	return @crypto_array 
end 