# vsearch

## Description

This cookbook installs VSEARCH, an alternative to USEARCH, which supports de novo and reference based chimera detection, clustering, full-length and prefix dereplication, rereplication, reverse complementation, masking, all-vs-all pairwise global alignment, exact and global alignment searching, shuffling, subsampling and sorting. It also supports FASTQ file analysis, filtering, conversion and merging of paired-end reads.

##Requirements

*Platform:*

* Ubuntu 14.04
* CentOS 7.2

## Usage
Simply include the recipe wherever you would like it installed, such as a run list (recipe[vsearch]) or a cookbook (include_recipe 'vsearch')


## Testing and converging
To test and converge the recipe, we make use of a Rakefile. By running `chef exec rake -T`, all available commands are shown.

```
chef exec rake all                          # Alias for kitchen:all
chef exec rake default                      # Run both test and converge
chef exec rake foodcritic                   # Lint Chef cookbooks
chef exec rake kitchen                      # Run kitchen: includes destroy, converge, verify - default: all
chef exec rake kitchen:all                  # Run all test instances
chef exec rake kitchen:default-centos-72    # Run default-centos-72 test instance
chef exec rake kitchen:default-ubuntu-1404  # Run default-ubuntu-1404 test instance
chef exec rake rspec                        # Run RSpec code examples
chef exec rake rubocop                      # Run RuboCop
chef exec rake rubocop:auto_correct         # Auto-correct RuboCop offenses
chef exec rake tests                        # Run all pre-convergence test: rubocop, foodcritic, rspec
```

For the pre-convergence tests (rubocop, foodcritic, rspec), you need to run `chef exec rake tests`.
To converge and verify, you run `chef exec rake kitchen:all` or `chef exec rake kitchen:$platform_name` if you want to specify the platform.

## Attributes

See attributes/default.rb for default values.

default['vsearch']['version']

## License and Authors

* Authors:: Greet De Baets (<chef@eaglegenomics.com>)

Copyright:: 2017, Eagle Genomics Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
