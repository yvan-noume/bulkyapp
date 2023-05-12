#!/bin/bash
set -e

host="$1"
shift
cmd="$@"

until /opt/mssql-tools/bin/sqlcmd -S "$host" -U sa -P $SA_PASSWORD -Q "SELECT 1;" &> /dev/null; do
  >&2 echo "SQL Server is unavailable - sleeping"
  sleep 1
done

>&2 echo "SQL Server is up - executing command"
exec $cmd