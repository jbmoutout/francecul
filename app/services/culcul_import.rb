


class CulCulImport

  def self.run(xml)

    filepath = File.expand_path(File.join(File.dirname(__FILE__), xml))
    xml_data = File.read(filepath)
    doc = Nokogiri::XML(xml_data)

    doc.css('item').each do |node|
      children = node.children

      Emission.create(
        :title => children.css('title').inner_text,
        :description => children.css('description').inner_text,
        :link => children.css('link').inner_text,
        :date => children.css('pubDate').inner_text
      )
    end
  end
end
