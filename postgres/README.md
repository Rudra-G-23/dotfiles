# PostgreSQL 18 on WSL2 + pgAdmin on Windows

This document records the local PostgreSQL setup used for WSL2 development so it can be reproduced on another computer later.

## Target setup

```text
Windows
├── pgAdmin 4 (GUI only)
│   ├── existing Windows PostgreSQL 17 (if present)
│   └── WSL PostgreSQL 18
│
└── WSL2 / Ubuntu
    ├── application code
    └── PostgreSQL 18
        └── traccia database
```

The PostgreSQL server runs inside WSL2. pgAdmin runs on Windows only as a GUI.

---

## 1. Install PostgreSQL inside WSL2

Open the Ubuntu / WSL terminal:

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib -y
```

Check the installed version:

```bash
psql --version
```

Check PostgreSQL clusters:

```bash
pg_lsclusters
```

Example:

```text
Ver Cluster Port Status Owner    Data directory
18  main    5432 online postgres /var/lib/postgresql/18/main
```

---

## 2. Start and stop PostgreSQL

Start PostgreSQL:

```bash
sudo service postgresql start
```

Stop PostgreSQL:

```bash
sudo service postgresql stop
```

Restart PostgreSQL:

```bash
sudo service postgresql restart
```

Check the cluster:

```bash
pg_lsclusters
```

### Disable automatic startup

If PostgreSQL should only run when needed:

```bash
sudo systemctl disable postgresql
```

Start it manually when working:

```bash
sudo service postgresql start
```

Re-enable automatic startup later:

```bash
sudo systemctl enable postgresql
```

Stopping PostgreSQL does not delete databases or data files.

---

## 3. Set the postgres user password

Open PostgreSQL as the system postgres account:

```bash
sudo -u postgres psql
```

Set a password:

```sql
ALTER USER postgres WITH PASSWORD 'YOUR_STRONG_PASSWORD';
```

Exit:

```sql
\q
```

Do not commit this password to Git.

---

## 4. Default local PostgreSQL connection

If no other PostgreSQL server conflicts with port 5432, keep the default port:

```text
Host: localhost
Port: 5432
Username: postgres
Database: postgres
```

Test:

```bash
psql -h localhost -p 5432 -U postgres -d postgres
```

---

## 5. Changing the WSL PostgreSQL port

This machine already had another PostgreSQL installation on Windows using port 5432, so the WSL PostgreSQL 18 server was changed to port 5433.

Current WSL setup:

```text
PostgreSQL version: 18
Cluster: main
Port: 5433
Database: traccia
User: postgres
```

Edit:

```bash
sudo nano /etc/postgresql/18/main/postgresql.conf
```

Search for:

```text
port =
```

Change:

```text
port = 5432
```

to:

```text
port = 5433
```

Do not change `listen_addresses` unless there is a specific networking requirement.

Save Nano:

```text
Ctrl + O
Enter
Ctrl + X
```

Restart:

```bash
sudo service postgresql restart
```

Verify:

```bash
pg_lsclusters
```

Expected:

```text
18  main  5433  online  postgres ...
```

Verify the listening socket:

```bash
sudo ss -ltnp | grep 5433
```

Expected local-only listening:

```text
127.0.0.1:5433
```

---

## 6. Create the traccia database

Connect to the default postgres database:

```bash
psql -h localhost -p 5433 -U postgres -d postgres
```

Create the database:

```sql
CREATE DATABASE traccia;
```

List databases:

```sql
\l
```

Exit:

```sql
\q
```

Test the new database:

```bash
psql -h localhost -p 5433 -U postgres -d traccia
```

Verify:

```sql
SELECT current_database();
```

Expected result:

```text
traccia
```

---

## 7. Current known-good WSL configuration

```text
Host: localhost
Port: 5433
Database: traccia
Username: postgres
PostgreSQL version: 18
Cluster: main
```

Check it at any time:

```bash
pg_lsclusters
```

Connect:

```bash
psql -h localhost -p 5433 -U postgres -d traccia
```

---

## 8. Application connection string

Typical PostgreSQL URL:

```text
postgresql://postgres:YOUR_PASSWORD@localhost:5433/traccia
```

If the password contains URL-special characters such as:

```text
@ : / # % ?
```

URL-encode the password before putting it in a connection URL.

For example:

```text
@  ->  %40
```

Prefer keeping credentials in a local `.env` file rather than source code.

Example:

```dotenv
DATABASE_URL=postgresql://postgres:URL_ENCODED_PASSWORD@localhost:5433/traccia
```

Make sure `.env` is ignored by Git:

```gitignore
.env
.env.local
.env.*.local
```

A safe committed template can look like:

```dotenv
DATABASE_URL=postgresql://postgres:YOUR_PASSWORD@localhost:5433/traccia
```

Save that as something like:

```text
.env.example
```

Never put the real password in `.env.example`.

---

## 9. pgAdmin on Windows

pgAdmin is only a GUI. Updating pgAdmin does not upgrade, downgrade, delete, or recreate PostgreSQL databases.

Official Windows download page:

https://www.pgadmin.org/download/pgadmin-4-windows/

As of 2026-08-23, the current Windows release listed by the pgAdmin project is pgAdmin 4 v9.17.

If an older pgAdmin such as 8.14 is installed, install the newer Windows pgAdmin version normally. Do not uninstall PostgreSQL just to update pgAdmin.

---

## 10. Register WSL PostgreSQL in pgAdmin

Keep any existing Windows PostgreSQL server registration.

Add a new server:

```text
Servers
-> Register
-> Server
```

General tab:

```text
Name: PostgreSQL 18 - WSL
```

Connection tab:

```text
Host name/address: localhost
Port: 5433
Maintenance database: postgres
Username: postgres
Password: YOUR_POSTGRES_PASSWORD
```

Save the server.

Expected pgAdmin tree:

```text
Servers
├── PostgreSQL 17
│   └── existing Windows databases
│
└── PostgreSQL 18 - WSL
    └── Databases
        ├── postgres
        └── traccia
```

If `traccia` appears under `PostgreSQL 18 - WSL`, the GUI connection is correct.

---

## 11. Important distinction: pgAdmin vs PostgreSQL

```text
PostgreSQL = database server + database data
pgAdmin    = graphical management application
```

Updating pgAdmin does not delete:

- PostgreSQL 17
- PostgreSQL 18
- databases
- tables
- application code
- migrations
- rows/data

The PostgreSQL data directory for this WSL cluster is:

```text
/var/lib/postgresql/18/main
```

Do not manually delete this directory.

---

## 12. WSL IP address

To inspect the current WSL IP:

```bash
hostname -I
```

Example from this setup:

```text
172.30.42.165
```

WSL IP addresses can change after restarting WSL or Windows, so application configuration should normally use `localhost` when both the application and PostgreSQL are running inside WSL.

The current PostgreSQL setup intentionally listens only on:

```text
127.0.0.1
```

This is preferred for local development because PostgreSQL is not exposed broadly to the network.

---

## 13. Troubleshooting

### Password authentication failed

If:

```text
FATAL: password authentication failed for user "postgres"
```

Reset the password:

```bash
sudo -u postgres psql
```

Then:

```sql
ALTER USER postgres WITH PASSWORD 'NEW_PASSWORD';
\q
```

Retest:

```bash
psql -h localhost -p 5433 -U postgres -d traccia
```

### `postgres` command not found

Do not use:

```bash
postgres
```

for normal interactive database access.

Use:

```bash
psql
```

instead.

### `sudo ss -ltnp | grep 5433` returns nothing

The PostgreSQL server may be stopped.

Check:

```bash
pg_lsclusters
```

Start it:

```bash
sudo service postgresql start
```

Then rerun:

```bash
sudo ss -ltnp | grep 5433
```

### Database exists in psql but not in pgAdmin

Usually pgAdmin is connected to a different PostgreSQL server.

Check:

- correct server registration
- host
- port
- PostgreSQL version
- refresh the Databases node

For this WSL installation, use:

```text
localhost:5433
```

---

## 14. Recommended development workflow

Start PostgreSQL:

```bash
sudo service postgresql start
```

Verify:

```bash
pg_lsclusters
```

Connect if needed:

```bash
psql -h localhost -p 5433 -U postgres -d traccia
```

Run the application.

When development is finished:

```bash
sudo service postgresql stop
```

---

## 15. Prompt for a coding agent

Use the following context when handing database integration to a coding agent:

```text
PostgreSQL is installed inside WSL2 Ubuntu.

PostgreSQL version: 18
Cluster: main
Host: localhost
Port: 5433
Database: traccia
Username: postgres

The traccia database already exists.

Inspect the repository and determine which database framework, ORM, and
migration system the project already uses. Do not introduce another ORM
if one already exists.

Configure the application to use this local PostgreSQL database.

Keep credentials in the correct local environment file and ensure secrets
are gitignored. Do not hard-code or commit passwords.

Run existing migrations when appropriate.

Do not drop, reset, truncate, recreate, or overwrite the database without
explicit confirmation.

Do not modify the separate Windows PostgreSQL 17 installation.

After setup, verify the application can connect successfully and report
the files changed and commands executed.
```

---

## 16. Quick recovery checklist on a new computer

After WSL2 itself is already installed:

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib -y
sudo service postgresql start
pg_lsclusters
sudo -u postgres psql
```

Inside psql:

```sql
ALTER USER postgres WITH PASSWORD 'YOUR_STRONG_PASSWORD';
CREATE DATABASE traccia;
\q
```

If port 5432 is free, keep it.

If Windows already uses PostgreSQL on 5432, change WSL PostgreSQL to 5433 in:

```text
/etc/postgresql/<VERSION>/main/postgresql.conf
```

Then restart:

```bash
sudo service postgresql restart
```

Test:

```bash
psql -h localhost -p 5433 -U postgres -d traccia
```

Install/update pgAdmin on Windows from:

https://www.pgadmin.org/download/pgadmin-4-windows/

Register the WSL server with:

```text
Host: localhost
Port: 5433
Database: postgres
Username: postgres
```

Then confirm the `traccia` database is visible.
