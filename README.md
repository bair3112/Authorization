# Authorization

Welcome! An introductory user authorization project is presented to your attention.

#### Initial defaults

To initialize a project with basic configurations, run the command:

```bash
make init
```

after initialization, edit the `.env` and `docker-compose.yml` files as you like.

### Hosts

To access the authorization application through a web browser, add the following line to the hosts configuration file `/etc/hosts`:

```txt
127.0.0.1 auth.local
```

### Development
In order to enter the application container, enter in the console:

```bash
make sh
```

To create migration files, in the console type:
```bash
migrate create -ext sql -dir migrations <migration_name>
```