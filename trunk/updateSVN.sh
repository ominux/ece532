#! /bin/bash
# script to clean up svn files that are gone

echo #
echo #
echo Deleting Lost Files, Adding New Files
echo #
echo #

svn status | grep '^\!' | sed 's/! *//' | xargs -I% svn rm %
svn add --force --depth infinity add .

echo #
echo #
echo Deleted All Lost Files, Added All New Files
echo #
echo #

