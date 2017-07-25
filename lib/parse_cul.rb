require 'nokogiri'
require 'open-uri'

module ParseCul
  def self.run
    years =  ["saison-29-08-2011-22-07-2012?", "saison-27-08-2012-21-07-2013?", "saison-22-07-2013-01-09-2013?", "saison-02-09-2013-06-07-2014?", "saison-07-07-2014-31-08-2014?", "saison-01-09-2014-05-07-2015?", "saison-06-07-2015-30-08-2015?", "saison-31-08-2015-04-07-2016?", "saison-04-07-2016-28-08-2016?"]
    # years =  ["saison-29-08-2011-22-07-2012?", "saison-27-08-2012-21-07-2013?"]
    root = "https://www.franceculture.fr/emissions/les-pieds-sur-terre/"
    years.each do |letter|
      1.upto(15).each do |count|
        page = "p=" + count.to_s
        puts page
        url = "#{root}#{letter}#{page}"
        # url = "#{root}#{letter}"
        begin
          html = open(url)
          doc = Nokogiri::HTML(html)
          doc.css('#main-content > article > section > div > button').each do |a|
            # puts a
            em = a.attributes['data-title-link'].value
            em_root = 'https://www.franceculture.fr'
            url = "#{em_root}#{em}"
            html = open(url)
            doc = Nokogiri::HTML(html)
            desc = doc.css('#main-content > article > div > div > div.text-zone > div.content-body').text
            # puts desc
            if a.attributes['title'] && a.attributes['data-asset-source']
              title = a.attributes['title'].value
              # puts title
              link = a.attributes['data-asset-source'].value
              d = a.attributes['data-asset-created-date'].value
              date =  DateTime.strptime(d,'%s')
              puts date
              e = Emission.find_or_initialize_by(link: link)
              e.update(
                :title => title,
                :link => link,
                :date => date,
                :description => desc
              )
            end
          end
        rescue OpenURI::HTTPError => e
          if e.message == '404 Not Found'
            puts "SKIP"
            break
          end
        end
      end
    end
    # end
  end
end
