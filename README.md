# The One Billion Row Challenge - Ruby Edition

Ruby edition of the [1BRC](https://github.com/gunnarmorling/1brc/tree/main) Java challenge.

# Setup 

```bash
bundle install

# 10 million measurements, ~10 seconds to generate on an M1 Macbook Pro.
bundle exec ruby create_measurements.rb 10000000

# Rename for use with the spec
mv measurements.txt measurements_test.txt

# In the background, kick off generation of 1B rows (takes about 12 minutes)
bundle exec ruby create_measurements.rb 1000000000 &
```

# Doing the Challenge 
Open up `challenge.rb` and fill in `perform_optimised`. 

You can run `bundle exec guard` to trigger the spec on save.

The provided spec will:
1. Check against the naive implementation to confirm correctness, and
2. Benchmark against the naive implementation to confirm performance improvement.

You can profile your code by running `./profile.sh` to see where your time is going.

When you think your implementation is getting good, try it out on the ~13GB `measurements.txt` by changing `Challenge::MEASUREMENTS_FILE_NAME`.  

You can try files of various sizes. The spec will cache the results of `perform_simple` per file name.

The spec executes `perform_optimised` once per run.