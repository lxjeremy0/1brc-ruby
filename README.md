# The One Billion Row Challenge - Ruby Edition

Ruby edition of the [1BRC](https://github.com/gunnarmorling/1brc/tree/main) Java challenge.

# Setup 

```bash
# Clone repo and cd into folder

bundle install

# 10 million measurements, ~10 seconds to generate on an M1 Macbook Pro.
bundle exec ruby create_measurements.rb 10000000

# Rename for use with the spec
mv measurements.txt measurements_test.txt

# In the background, kick off generation of 1B rows (takes about 12 minutes)
bundle exec ruby create_measurements.rb 1000000000 &

# View the expected output
bundle exec ruby run.rb --show
```

# Doing the Challenge 
Open up `challenge.rb` and fill in `perform_optimised`. 

You can run `bundle exec guard` to trigger the spec on save (only triggers when saving the spec file).

The provided spec will:
1. Check against the simple implementation to confirm correctness, and
2. Benchmark against the simple implementation to confirm performance improvement.

The spec will show you an improvement factor as below:

```
INFO - Running: spec/challenge_spec.rb
.     
Simple:         4.2s
Optimised:      4.2s
Improvement:    1.0x
.

Finished in 8.54 seconds (files took 0.58037 seconds to load)
2 examples, 0 failures
```

Get this factor as high as you can. It may initially be below one, because each run will have a slightly different time.

The spec will cache the results of `perform_simple` per file name and execute `perform_optimised` once per run.

You can profile your code by running `./profile.sh` to see where your time is going.

When you think your implementation is getting good, try it out on the ~13GB `measurements.txt` by changing `Challenge::MEASUREMENTS_FILE_NAME`.  

# Strategies

Since the goal is fun and learning rather than competition, there aren't any hard and fast rules.

You can use whatever tech you like. There's lots of prior art in just about every language. The most common theme is concurrency.

People have used SIMD instructions, memory mapped files and many other tricks.

Some relevant reading:
 - https://benhoyt.com/writings/go-1brc/
 - https://pkolaczk.github.io/disk-parallelism/
