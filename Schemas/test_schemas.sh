#! /bin/sh
echo "*** Sample 1 ***"
xmllint Sample1.xml --noout --relaxng MarkupKit.rng

echo "\n*** Sample 2 ***"
xmllint Sample2.xml --noout --relaxng MarkupKit.rng
