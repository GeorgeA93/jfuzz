# jfuzz

Generate random data from your JSON schemas.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jfuzz'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jfuzz

## Usage

```
require "jfuzz"

schema_path = "path/to/your/json-schema"
Jfuzz.fuzz(schema_path)
```

### Configuration

#### Nil Probability

This determines how often we leave out optional fields. The default is `0.2` meaning we will leave out optional fields 20% of the time. It can be changed by:

```
Jfuzz.set_nil_probability(0.5)
```

#### True Probability

This determines how likely a boolean type is to have a true value. The default is `0.5`

```
Jfuzz.set_true_probability(0.5)
```


#### Min/Max Integer/Number values

You can change the min and max values of integers/numbers that are used when no minimums or maximums are supplied in your schema. The defaults are: -9999999 and 9999999.

```
Jfuzz.set_min_integer(10)
Jfuzz.set_max_integer(100)
```

#### Min/Max Array Lengths

You can change the min and max length of arrays. These are used to generate a random length for an array when you do no specify a min or a max length in you schema. The defaults are 1 and 100

```
Jfuzz.set_min_array_length(10)
Jfuzz.set_max_array_length(100)
```

### Generators

If you want custom behaviour when fuzzing a particular type, you can change our built in default generators. This is also useful if you want to add support for your own custom type. First you must define a generator class, e.g. lets say we want to do our own string generation logic:

```ruby
require "jfuzz/generators/generator"

class BetterStringGenerator < Jfuzz::Generator
    def generate
        "AMAZING STRING"
    end

    def self.type
      "string"
    end
end
```

Finally you need to register the generator with JFuzz by doing the following:

```ruby
Jfuzz.register_generator(BetterStringGenerator)
```

Note. You will need to register your new generator before calling `Jfuzz.fuzz`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/georgea93/jfuzz.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

