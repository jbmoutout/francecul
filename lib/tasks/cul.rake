require 'rake'
require 'open-uri'


namespace :cul do
    desc 'Scrap Cul'
    task :xml_parser => :environment do
        doc = Nokogiri::XML(open("http://radiofrance-podcast.net/podcast09/rss_10078.xml"))
        doc.css('item').each do |node|
          children = node.children

          e = Emission.find_or_initialize_by(link: children.css('guid').inner_text)
          e.update(
            :title => children.css('title').inner_text,
            :description => children.css('description').inner_text,
            :link => children.css('guid').inner_text,
            :date => children.css('pubDate').inner_text
          )
        end
        TextParser.sonia_remover
      end
end
