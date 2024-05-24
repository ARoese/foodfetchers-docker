param(
    [String]$containerPrefix,
    [ValidateScript({if ($_){!(Test-Path $_)}})]
    [String]$backupLoc
)

mkdir -f $backupLoc;
docker exec -i "$containerPrefix-database-1" pg_dump --clean -U fetcher1 -C main > "$backupLoc/pg_dump.sql";

docker cp "$containerPrefix-site-1:/var/www/html/coverimages/." "$backupLoc/coverimages/";