module RefererParser
  module Rails
    class Engine < ::Rails::Engine
      # initializer "referer_parser.register_extensions" do
        ActionDispatch::Request.send :include, Request
      # end
    end
  end
end