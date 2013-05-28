require 'referer-parser'

module RefererParser
  module Rails
    module Request
      def search_term
        self.referer_parser.present? ? self.referer_parser.search_term : nil
      end

      def search_engine
        self.referer_parser.present? ? self.referer_parser.referer : nil
      end

    protected
      
      def referer_parser
        return @referer_parser if defined?(@referer_parser)
        @referer_parser = referer.present? ? RefererParser::Referer.new(referer) : nil
      end
    end
  end
end