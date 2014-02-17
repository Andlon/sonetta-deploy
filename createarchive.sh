#!/bin/bash

# Creates a .tar.gz archive for sonetta.
tar -v --transform 's,sonetta/release/,sonetta/,' -czf sonetta.tar.gz sonetta/release/

# Creates a .tar.bzip2 archive for sonetta.
tar -v --transform 's,sonetta/release/,sonetta/,' -cjf sonetta.tar.bz2 sonetta/release/
