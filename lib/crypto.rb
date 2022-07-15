require 'nokogiri'
require 'rubygems'
require 'pry'
require 'open-uri'


def url 
  page = doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
end

def noms_crypto
  page = url
  cryptos = []
  page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody //div/a[contains(@class, "cmc-table__column-name--symbol")]').each do |x|
    cryptos.push(x.text)
  end
  return cryptos
end

def prix_crypto
  page = url 
  valeur = []
  page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody //tr/td[contains(@class, "cmc-table__cell--sort-by__price")]').each do |node|
	valeur.push(node.text[1..-1].gsub(/[^\d^.]/,'').to_f)
  end
  return valeur
end

def array_crypto
  cryptos = noms_crypto
  valeur = prix_crypto
  final_array = cryptos.zip(valeur).map{|k, v| {k =>v}}
  return final_array
end
puts array_crypto
