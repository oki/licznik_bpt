#!/usr/local/bin/ruby

require 'rubygems'
require 'pp'
require 'mechanize'
require 'bpt'

url = "http://bpt.debica.org/"

agent = Mechanize.new
page = agent.get(url)
forum_link = page.links.find { |l| l.text =~ /Forum/ }
unless forum_link
    raise "nie moge znalezc linka do forum"
end

page = forum_link.click
licznik_link = page.links.find { |l| l.text =~ /Licznik/ }
unless licznik_link
    raise "nie moge znalezc linka do licznika"
end

page = licznik_link.click
# miesiac_link = page.links.find { |l| l.text =~ /KWIECIE/ }
miesiac_link = page.links.find { |l| l.text =~ /MAJ/ }
unless miesiac_link
    raise "nie moge znalezc linka do licznika"
end
page = miesiac_link.click

def dump_page(name,page)
    File.open(name,'w') do |file|
        file.puts page
    end
end

bikers = Hash.new(0) # hash z bikerami, nick => ilosc km
20.times do # max 20 stron w wątku
    page.search('td[@class*="windowbg"]').each do |e|
        # nick = e.search('b a')[0].text
        # nick = e.search('b')[0].text
        nick = e.search('td.contacts a')[0].text
        msg = e.search('div.post').first.text.strip


        dist,all = BPT.scan_for_distance(msg)
        # puts nick
        # puts " #{msg} (#{dist},#{all})"
        puts "#{nick} + #{dist} km"
        bikers[nick] += dist
    end

    next_page_text = page.search('.middletext').first.search('b').first.next_sibling.next_sibling.text rescue nil
    pp next_page_text

    unless next_page_text
        puts "Koniec, spadamy :-)"
        break
    end

    next_page_link = page.links.find { |l| l.text == next_page_text }

    # pp next_page_link
    page = next_page_link.click

    # dump_page("#{next_page_text}.html", page.content)
end

arr = bikers.sort { |a, b| b[1] <=> a[1] }

arr.each_with_index do |biker,index|
    puts "#{index+1}. #{biker[0]}: #{biker[1]} km"
end
