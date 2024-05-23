
# first argument is database to import. Must be a text-dump
cat $args[1] | docker exec -i $args[0] psql -U fetcher1 -d postgres;
#echo "----------Done restoring----------"
#echo "Sleeping for 10 seconds to give you time to see errors"
#echo "feel free to ctrl-c"
#sleep 10;