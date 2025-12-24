# Use the latest stable PostgreSQL image
FROM postgres:17

# Set environment variables (can be overridden)
ENV POSTGRES_DB=mydb
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Expose PostgreSQL port
EXPOSE 5432

# Create a volume for persistent data
VOLUME ["/var/lib/postgresql/data"]

# The postgres image already has the proper ENTRYPOINT and CMD configured
