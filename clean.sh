#!/bin/bash
#this cleans directories after this to remove temp files with core and charmrun in the name.
find . -name "core*" -exec rm -rf {} \;
find . -name "charmrun*" -exec rm -rf {} \;
