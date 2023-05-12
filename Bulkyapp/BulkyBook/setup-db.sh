#!/bin/bash

# Wait for SQL Server to start
echo "Waiting for SQL Server to start..."
sleep 30s

# Run SQL script to create database schema and tables
echo "Creating database schema and tables..."
/opt/mssql-tools/bin/sqlcmd -S bulkybookweb_database -U sa -P $SA_PASSWORD -i create-database.sql
/opt/mssql-tools/bin/sqlcmd -S bulkybookweb_database -U sa -P $SA_PASSWORD -i create-tables.sql