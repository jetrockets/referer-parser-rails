# Referer::Parser::Rails

It is a [referer-parser](https://github.com/snowplow/referer-parser/blob/master/ruby/README.md)
 extension for Rails.

## Installation

Add this line to your application's Gemfile:

    gem 'referer-parser-rails'

And then execute:

    $ bundle


## Usage

Then you can use two methods for your ActionDispatch::Request object in application:

```ruby
# Get search term from referer and return it as string. If referer not present then returns nil.
request.search_term

# Get search term from referer and return it as string. If referer not present then will returns nil.
request.search_engine
```

## Why being userfull?
You have some product in your e-shop, for example, "iPad 2". And your buyers can find the link to this product on google, yandex or any other search engine. And what if Apple Co. has launched "The new Ipad" and now you have no "iPad 2"s in stock in the shop but the link to this product is still alive and people, while browsing the web, can still find it and get 404 error.

If the user comes across this kind of page browsing this or that search engine, he will find the special "404" page. On our website he will get the status "404" and what more find the results of the search according to his search term.

The only thing you need to do is to write in your controller something like this:

```ruby
if request.search_term.present?
  # find the goods on the website according to user search term
  @proposals = Search::Manager.new({:query => request.search_term})
end
```  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request