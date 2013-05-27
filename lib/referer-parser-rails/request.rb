require 'referer-parser'

module ActionDispatch
  class Request
    def search_term
      return @search_term if defined?(@search_term)
      @search_term = self.referer_parser.present? ? self.referer_parser.search_term : nil
    end

    def search_engine
      return @search_engine if defined?(@search_engine)
      @search_engine = self.referer_parser.present? ? self.referer_parser.referer : nil
    end

    protected
    
    def referer_parser
      return @referer_parser if defined?(@referer_parser)
      @referer_parser = referer.present? ? ::RefererParser::Referer.new(referer) : nil
    end  
  end
end