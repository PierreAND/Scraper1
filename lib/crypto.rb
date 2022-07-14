require 'nokogiri'
require 'rubygems'
require 'pry'
require 'open-uri'


def scrap_symbols
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  20.times do |i| 
    all_cryptos_symbols = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a[1]").text
    puts all_cryptos_symbols
  end
  
end

def scrap_prices
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  20.times do |i|
    all_cryptos_prices = page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]").text
  puts all_cryptos_prices
  end
end
 
