#!/bin/bash¬

echo "Install P4Merge"
hdiutil mount P4V.dmg
sudo cp -R "/Volumes/P4V/p4merge.app" /Applications
hdiutil unmount "/Volumes/P4V/"

echo "Install P4Merge extDiff and extMerge file tools"
# The extDiff is setup on an external file with path: /usr/local/extDiff
cp extDiff /usr/local/bin/extDiff
chmod 755 /usr/local/bin/extDiff

# This extMerge is setup on an external file with Path: /usr/local/extMerge
cp extMerge /usr/local/bin/extMerge
chmod 755 /usr/local/bin/extMerge

echo "P4Merge tool instaled and ready to use"
echo "To test it, just do 'git diff'"