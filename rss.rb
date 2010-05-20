#!/usr/local/bin/ruby

require 'open-uri'
require 'digest/md5'

url = "http://bpt.debica.org/index.php?option=com_smf&Itemid=54&action=recent&board=9.0&type=rss;action=.xml&view=rss&format=raw"
digest = Digest::MD5.hexdigest( open(url).read )
# puts digest

rss_md5 = Dbconfig.find_by_name("rss_md5")

unless rss_md5
  puts "Abu"
  exit 0
end

if rss_md5.value != digest
  puts "Updejtujemy"
  system("#{File.dirname(__FILE__)}/script/runner #{File.dirname(__FILE__)}/km.rb")
  rss_md5.value = digest
  rss_md5.save
else
  puts "Brak nowosci"
end

# rss_md5.value = "dupa"
# rss_md5.save
