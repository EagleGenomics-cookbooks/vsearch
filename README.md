# vsearch

Description
===========
This Cookbook installs VSEARCH, an alternative to USEARCH, which supports de novo and reference based chimera detection, clustering, full-length and prefix dereplication, rereplication, reverse complementation, masking, all-vs-all pairwise global alignment, exact and global alignment searching, shuffling, subsampling and sorting. It also supports FASTQ file analysis, filtering, conversion and merging of paired-end reads.

Requirements
============

## Platform:

* Ubuntu 14.04
* CentOS 7.2

Notes
=====

Usage
=====
Simply include the recipe wherever you would like it installed, such as a run list (recipe[vsearch]) or a cookbook (include_recipe 'vsearch')


## Testing
To test the recipe we use chef test kitchen:

kitchen converge

kitchen login

kitchen verify

kitchen destroy

kitchen test

Attributes
==========
See attributes/default.rb for default values.

default['vsearch']['version']

License and Authors
===================

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
