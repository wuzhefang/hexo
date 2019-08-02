#!/bin/sh
jekyll build&&
echo "jekyll build success."
git add -A&&
echo "add success."
git commit -m 'add or modify the posts.'&&
echo "commit success."
git push origin master
echo "push success."
