# AppleSimUtils

Light wrapper for https://github.com/wix/AppleSimulatorUtils .

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apple_sim_utils'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apple_sim_utils

## Usage

```
$ cmd = AppleSimUtils::Cmd.new(bundle_id: 'com.apple.example')
$ cmd.allow_all(device: 'iPhone SE, OS = 10.3', permissions: %w(notifications photos camera))
```

See test/apple_sim_utils_test.rb for more details.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/KazuCocoa/apple_sim_utils.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

