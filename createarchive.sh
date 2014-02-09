#!/bin/bash

# Creates a .tar.gz archive for sonetta.
tar -v --transform 's,sonetta/release/,sonetta/,' -czf sonetta.tar.gz sonetta/release/
