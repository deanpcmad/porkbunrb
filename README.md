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

# Get forwards for a domain
# Returns a Porkbun::Collection
Porkbun::Domain.get("deanpcmad.dev").forwards
#=> #<Porkbun::Collection:0x00 @data=[#<Porkbun::Forward record="www.deanpcmad.dev">]>

# Add a forward
# Subdomain is optional
# API Docs: https://porkbun.com/api/json/v3/documentation#Domain%20Add%20URL%20Forward
Porkbun::Domain.add_forward(
  domain: "deanpcmad.dev",
  subdomain: "site",
  location: "https://deanpcmad.com",
  type: "temporary",
  include_path: true
)
#=> true

# Delete a forward
Porkbun::Domain.delete("deanpcmad.dev", record: "123123")
#=> true
```

### Records

```ruby
# Retrieve a list of all records for a domain
# Returns a Porkbun::Collection
Porkbun::Record.list(domain: "deanpcmad.dev")
#=> #<Porkbun::Collection:0x00 @data=[#<Porkbun::Record content="pixie.porkbun.com">]>

# Retrieve a list of all records for a domain by type
# Returns a Porkbun::Collection
Porkbun::Record.list_by_type(domain: "deanpcmad.dev", type: "CNAME", subdomain: "*")
#=> #<Porkbun::Collection:0x00 @data=[#<Porkbun::Record content="pixie.porkbun.com">]>

# Get a record
Porkbun::Record.retrieve(domain: "deanpcmad.dev", id: "123")
#=> #<Porkbun::Record content="pixie.porkbun.com">

# Add a record
# Name, TTL and Prio are optional
# API Docs: https://porkbun.com/api/json/v3/documentation#DNS%20Create%20Record
Porkbun::Domain.add_record(
  domain: "deanpcmad.dev",
  type: "A",
  value: "1.2.3.4",
  name: "test"
)
#=> true

# Update a record
Porkbun::Domain.update_record(
  domain: "deanpcmad.dev",
  id: "123123",
  type: "A",
  value: "1.2.3.5",
  name: "test"
)
#=> true

# Delete a record
Porkbun::Domain.delete_record(
  domain: "deanpcmad.dev",
  record: "www.deanpcmad.dev"
)
#=> true

# Delete a record by subdomain and type
Porkbun::Record.delete_by_subdomain(
  domain: "deanpcmad.dev",
  type: "A",
  subdomain: "test"
)
#=> true
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/porkbunrb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
