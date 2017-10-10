#! /bin/bash

echo "Generating $1.rss...be patient!"

cd /home/flex/www/fleischmann.hu/podcast/tilos

cp "$1".header.temp "$1".rss

date=`date -R`
YYYY=`date "+%Y"`
MM=`date "+%m"`
DD=`date "+%d"`

#date='manual'
#YYYY=2011
#MM=11
#DD=18

perl -pi -e "s/_lastBuildDate_/$date/" "$1".rss

cp "$1".body.temp "$1".tmp 

perl -pi -e "s/_pubDate_/$date/g" "$1".tmp
perl -pi -e "s/_date_/$YYYY.$MM.$DD./g" "$1".tmp
perl -pi -e "s/_YYYY_/$YYYY/g" "$1".tmp
perl -pi -e "s/_DD_/$DD/g" "$1".tmp
perl -pi -e "s/_MM_/$MM/g" "$1".tmp

cat "$1".old >> "$1".tmp
cat "$1".tmp >> "$1".rss
cp "$1".tmp "$1".old
rm "$1".tmp

cat common.footer.temp >> "$1".rss

/home/flex/bin/upload_fleischmann.hu
