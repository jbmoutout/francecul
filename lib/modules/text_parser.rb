module TextParser
    def self.word_counter(string, max)
      string.split(/\s+/)
            .group_by{|x|x}
            .map{|x,y|[x,y.size]}
            .sort_by{|_,size| size}
            .last(max)
    end
end
