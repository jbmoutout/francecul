module TextParser
    def self.word_counter(string, max)
      string.split(/\s+/)
            .group_by{|x|x}
            .map{|x,y|[x,y.size]}
            .sort_by{|_,size| size}
            .last(max)
    end

    def self.cul_key (keyword)
      key = '%'+ keyword + '%'
      @cul = Emission.where('description LIKE ?', key)
    end

    def self.sonia_remover
      Emission.all.each do |e|
        clean = e.description.sub(/^[^_]*sonia -/, "")
        e.description = clean
        e.save
      end
    end


end
