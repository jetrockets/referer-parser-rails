require 'faker'

FactoryGirl.define do
  factory :request, :class => ActionDispatch::Request do |r|
    trait :without_referer do
      after(:build) do |obj|
        obj.env['HTTP_REFERER'] = nil
      end
    end

    trait :with_referer do
      after(:build) do |obj|
        obj.env['HTTP_REFERER'] = 'http://yandex.ru/yandsearch?lr=14&text=ruby+on+rails'
      end
    end

    initialize_with{ new(Rack::MockRequest.env_for('/')) }

    factory :request_without_referer,   traits: [:without_referer]
    factory :request_with_referer,   traits: [:with_referer]
  end
end