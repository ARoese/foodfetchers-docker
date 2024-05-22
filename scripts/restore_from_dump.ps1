
# first argument is database to import. Must be a text-dump
cat $args[0] | docker exec -i foodfetchers-database-1 psql -U fetcher1 -d postgres;
#echo "----------Done restoring----------"
#echo "Sleeping for 10 seconds to give you time to see errors"
#echo "feel free to ctrl-c"
#sleep 10;