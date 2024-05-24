param(
    [String]$containerPrefix,
    [ValidateScript({if ($_){Test-Path $_}})]
    [String]$backupLoc
)

Get-Content "$backupLoc/pg_dump.sql" `
    | docker exec -i "$containerPrefix-database-1" psql -U fetcher1 -d postgres;

docker cp "$backupLoc/coverimages/." "$containerPrefix-site-1:/var/www/html/coverimages/";