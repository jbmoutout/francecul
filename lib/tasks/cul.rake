require 'rake'
require 'open-uri'
require 'Nokogiri'


namespace :cul do
    desc 'Scrap Cul'
    task :xml_parser => :environment do
        doc = Nokogiri::XML(open("http://radiofrance-podcast.net/podcast09/rss_10078.xml"))
        doc.css('item').each do |node|
          children = node.children

          Emission.create(
            :title => children.css('title').inner_text,
            :description => children.css('description').inner_text,
            :link => children.css('guid').inner_text,
            :date => children.css('pubDate').inner_text
          )
        end
      end
end
