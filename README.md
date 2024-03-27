# The One Billion Row Challenge - Ruby Edition

Ruby edition of the [1BRC](https://github.com/gunnarmorling/1brc/tree/main) Java challenge.

# Setup 

```bash
bundle install

# 10 million measurements, ~10 seconds to generate on an M1 Macbook Pro.
# Generating 1B rows takes around 12 minutes.
bundle exec ruby create_measurements.rb 10000000

bundle exec guard
```

# Doing the Challenge 
Open up `challenge.rb` and fill in `perform_optimised`. 

The provided spec will:
1. Check against the naive implementation to confirm correctness, and
2. Benchmark against the naive implementation to confirm performance improvement.

You can profile your code by running `./profile.sh` to see where your time is going.