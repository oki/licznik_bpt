#!/usr/local/bin/ruby


require 'rubygems'
require 'nokogiri'
require 'pp'


file = IO.read('6.html')
page = Nokogiri::HTML file


page.css('td[@class*="windowbg"]').each do |e|

    # nick = e.search('b a')[0].text
    # nick = e.search('b')[0].text
    nick = e.search('td.contacts a')[0].text
    msg = e.search('div.post').first.text

    puts nick
    pp msg
end

#   next_page_text = page.search('.middletext').first.search('b').first.next_sibling.next_sibling.text rescue nil
#   pp next_page_text
#   unless next_page_text
#       puts "Koniec, spadamy :-)"
#       break
#   end
#   next_page_link = page.links.find { |l| l.text == next_page_text }
#   pp next_page_link
#   page = next_page_link.click

