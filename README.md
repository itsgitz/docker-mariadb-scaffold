# docker-mariadb-scaffold

Run MariaDB 11.8 LTS locally with Docker Compose.

## Prerequisites

- Docker Engine 24+
- Docker Compose v2

## Quick Start

```bash
cp .env.example .env
# Edit .env — change passwords before first run
make run
```

## Make Targets

| Target | Description |
|---|---|
| `make run` | Start container in background |
| `make stop` | Stop container (preserves data) |
| `make start` | Start a stopped container |
| `make restart` | Stop then start |
| `make client` | Connect as root via mariadb CLI |
| `make logs` | Tail container logs |
| `make ps` | Show container status and health |
| `make backup` | Dump all databases to `backup_YYYYMMDD_HHMMSS.sql` |
| `make restore FILE=<dump.sql>` | Restore from a dump file |
| `make destroy` | **Destroy container and volume (data loss)** |

## Init Scripts

Drop `.sql` or `.sh` files into `initdb/` — MariaDB runs them automatically on first
container start (when the volume is empty). Useful for schema creation and seed data.

```
initdb/
  01-schema.sql
  02-seed.sql
```

## Custom Config

Drop `.cnf` files into `conf.d/` to override MariaDB settings (charset, buffer sizes,
etc.).

```
conf.d/
  custom.cnf
```

## Security Notes

- Port bound to `127.0.0.1` only — not accessible from outside the host.
- **Change all default passwords** in `.env` before use.
- Apps should connect as `MARIADB_USER`, not root.
