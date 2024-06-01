# PorkbunRB

PorkbunRB is a Ruby library for the Porkbun API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "porkbunrb"
```

## Usage

### Set Client Details

Firstly you'll need to create an API Key & Secret, which you can generate on the [Porkbun API page](https://porkbun.com/account/api).
Once you have these details, you can configure the client with the following:

```ruby
Porkbun.configure do |config|
  config.api_key    = ENV["PORKBUN_API_KEY"]
  config.api_secret = ENV["PORKBUN_API_SECRET"]
end
```

### Domains

```ruby
# Retrieve a list of all domains
# Returns a Porkbun::Collection
Porkbun::Domain.list
#=> #<Porkbun::Collection:0x00 @data=[#<Porkbun::Domain domain="deanpcmad.dev">]>

# Get name servers for a domain
# Returns a Porkbun::Collection
Porkbun::Domain.get("deanpcmad.dev").name_servers
#=> #<Porkbun::Collection:0x00 @data=[#<Porkbun::NameServer ns="ns1.deanpcmad.dev">]>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/porkbun.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
