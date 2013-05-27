require "spec_helper"

describe ActionDispatch::Request do
  before :all do
    @request_without_referer = FactoryGirl.build(:request_without_referer)
    @request_with_referer = FactoryGirl.build(:request_with_referer)
  end

  it "should be requests" do
    @request_without_referer.should be
    @request_with_referer.should be
  end

  context 'all requests should respond to' do
    it 'search_term' do
      @request_without_referer.should respond_to(:search_term)
      @request_with_referer.should respond_to(:search_term)
    end
    
    it 'search_engine' do
      @request_without_referer.should respond_to(:search_engine)
      @request_with_referer.should respond_to(:search_engine)
    end
  end

  context 'request without referer' do
    it 'search_term and search_engine methods should not be' do
      @request_without_referer.search_term.should_not be
      @request_without_referer.search_engine.should_not be
    end
  end

  context 'request with referer' do
    it 'search_term and search_engine methods should be' do
      @request_with_referer.search_term.should be
      @request_with_referer.search_term.should be
    end
  end
end