# PostgreSQL Docker Container

A reusable PostgreSQL container configuration for various projects.

## Quick Start

### Using Docker Compose (Recommended)

```bash
# Start the container
docker-compose up -d

# Stop the container
docker-compose down

# Stop and remove volumes
docker-compose down -v
```

### Using Docker Build

```bash
# Build the image
docker build -t my-postgres .

# Run the container
docker run -d \
  --name psql_container \
  -e POSTGRES_DB=mydb \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 \
  -v postgres_data:/var/lib/postgresql/data \
  my-postgres
```

## Configuration

### Environment Variables

Copy `.env.example` to `.env` and modify as needed:

- `POSTGRES_DB`: Default database name (default: mydb)
- `POSTGRES_USER`: PostgreSQL username (default: postgres)
- `POSTGRES_PASSWORD`: PostgreSQL password (default: postgres)

### Initialization Scripts

Place any `.sql` or `.sh` scripts in the `init/` directory. They will be executed in alphabetical order when the container is first created.

## Connecting to PostgreSQL

### From Host Machine

```bash
psql -h localhost -p 5432 -U postgres -d mydb
```

### From Another Container

```bash
psql -h postgres -p 5432 -U postgres -d mydb
```

### Connection String

```
postgresql://postgres:postgres@localhost:5432/mydb
```

## Useful Commands

```bash
# View logs
docker-compose logs -f postgres

# Access PostgreSQL shell
docker-compose exec postgres psql -U postgres

# Backup database
docker-compose exec postgres pg_dump -U postgres mydb > backup.sql

# Restore database
docker-compose exec -T postgres psql -U postgres mydb < backup.sql

# Check container health
docker-compose ps
```

## Data Persistence

Data is persisted in a Docker volume named `postgres_data`. To completely remove all data:

```bash
docker-compose down -v
```

## Version

This configuration uses PostgreSQL 17 (latest stable version as of December 2024).
