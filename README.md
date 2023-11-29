# keycloak-admin

Ruby AdGuardHome client library.

## Introduction

`AdGuardHome` is a Ruby client for the Network-wide ads & trackers blocking
DNS server [AdGuardHome](https://github.com/AdGuardTeam/AdGuardHome).

## Installation

```sh
 $ gem install --file --without development,test
 $ gem build
 $ VERSION=$(ruby -Ilib -e 'require "adguardhome/version"; puts AdGuardHome::VERSION')
 $ gem install --local adguardhome-${VERSION}.gem
```

## Usage

The required step is to set up a connection to a AdGuardHome service.

```ruby
require 'adguardhome'

AdGuardHome.configure do |config|
  config.username   = 'admin',
  config.password   = 'admin',
  config.base_url   = 'http://localhost'
end
```

Following example gets the current DNS server status and general settings.

```ruby
AdGuardHome.common.status

{"version"=>"v0.107.41",
 "language"=>"en",
 "dns_addresses"=>["127.0.0.1"],
 "dns_port"=>53,
 "http_port"=>80,
 "protection_disabled_duration"=>0,
 "protection_enabled"=>true,
 "dhcp_available"=>true,
 "running"=>true}
```

For further usage use `ri` or `rake doc` to create HTML documentation files.

## License

[MIT License](https://spdx.org/licenses/MIT.html)

## Is it any good?

[Yes.](https://news.ycombinator.com/item?id=3067434)
