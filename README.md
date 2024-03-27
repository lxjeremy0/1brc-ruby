# The One Billion Row Challenge - Ruby Edition

Ruby edition of the [1BRC](https://github.com/gunnarmorling/1brc/tree/main) Java challenge.

# Setup 

```bash
bundle install

# 10 million measurements, ~10 seconds to generate on an M1 Macbook Pro.
# Generating 1B rows takes around 12 minutes.
bundle exec ruby create_measurements.rb 10000000

bundle exec ruby calculate_average.rb
```
