# README
1. To start the project simply clone the repository and run `docker compose up`
2. For the first run you need to exceute:
* `docker exec -it <container name> bin/rails db:migrate` to run migrations
(To get appropriate container name view `docker ps` and choose container running rails app.)
* `docker exec -it <container name> bin/rails tailwind:install` to prepare tailwind
3. Visit webpage on `localhost:3007` to view the app.

If there are any pending migrations in the future you can execute `docker exec -it <container name> bin/rails db:migrate`.
In case if you want to start development you need to have ruby 3.2.1 pre installed.
In this case you can start only postgresql database in a container by running `docker compose up db` and then you can run rails sever localy on host machine.
