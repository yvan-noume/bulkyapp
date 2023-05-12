# Use Microsoft SQL Server 2019 base image
FROM mcr.microsoft.com/mssql/server

# Set environment variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=TextaxG23@@g

# Create directory for SQL scripts
#RUN mkdir /sql-scripts
WORKDIR /sql-scripts

# Copy SQL scripts to container
COPY create-database.sql .
COPY create-table.sql .

# Wait for SQL Server to be ready
COPY wait-for-sql.sh .
#CMD chmod +x wait-for-sql.sh

# Run SQL scripts to create database schema and tables
CMD /opt/mssql/bin/sqlservr & \
# Wait for the SQL Server to start
    (until /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P TextaxG23@@g -Q "SELECT 1" > /dev/null 2>&1; do echo 'Waiting for SQL Server to start...' && sleep 1; done) && \
# Execute the SQL scripts
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P TextaxG23@@g -i create-database.sql && \
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P TextaxG23@@g -i create-table.sql && \
# Keep the container running
    tail -f /dev/null

## Expose SQL Server port
#EXPOSE 1433