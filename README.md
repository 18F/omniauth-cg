# OmniAuth::Strategies::Cg

This gem contains the Cloud.gov strategy for OmniAuth.

View the OmniAuth 1.0 docs for more information about strategy implementation:
https://github.com/intridea/omniauth.

## Before You Begin

[TBD]


## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-cg', git: 'https://github.com/18F/omniauth-cg.git'
```

Next, tell OmniAuth about this provider. For a Rails app, your
`config/initializers/omniauth.rb` file should look like this:

```ruby
provider(
  :cg,
  "CONSUMER_KEY",
  "CONSUMER_SECRET",
  scope: "profile.email tasks submit_forms notifications"
)
```

Replace CONSUMER_KEY and CONSUMER_SECRET with the appropriate values you obtained from [Cloud.gov](#) earlier. Valid scopes are:
- profile.email
- profile.title
- profile.first_name
- profile.middle_name
- profile.last_name
- profile.suffix
- profile.address
- profile.address2
- profile.city
- profile.state
- profile.zip
- profile.phone_number
- profile.mobile_number
- profile.gender
- profile.marital_status
- profile.is_parent
- profile.is_student
- profile.is_veteran
- profile.is_retired
- tasks
- notifications
- submit_forms

## Authentication Hash
An example auth hash available in `request.env['omniauth.auth']`:

```ruby
{
  "provider"=>"cg",
  "uid"=>"r03Ke0000000000FrqOOFlq0DeNc9q1QQQQQQQQC",
  "info"=>{"email"=>"johnq@bloggs.com"},
  "credentials"=>{"token"=>"3gnsgg14ymf54mquevfry38ao", "expires"=>false},
  "extra"=>
    {"raw_info"=>
      {"title"=>nil,
      "first_name"=>nil,
      "middle_name"=>nil,
      "last_name"=>nil,
      "suffix"=>nil,
      "address"=>nil,
      "address2"=>nil,
      "city"=>nil,
      "state"=>nil,
      "zip"=>nil,
      "phone_number"=>nil,
      "mobile_number"=>nil,
      "gender"=>nil,
      "marital_status"=>nil,
      "is_parent"=>nil,
      "is_retired"=>nil,
      "is_veteran"=>nil,
      "is_student"=>nil,
      "email"=>"johnq@bloggs.com
      "uid"=>"r03Ke0000000000FrqOOFlq0DeNc9q1QQQk390QC"
    }
  }
}
```

## Watch the RailsCast

Ryan Bates has put together an excellent RailsCast on OmniAuth:

[![RailsCast #241](http://railscasts.com/static/episodes/stills/241-simple-omniauth-revised.png "RailsCast #241 - Simple OmniAuth (revised)")](http://railscasts.com/episodes/241-simple-omniauth-revised)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
