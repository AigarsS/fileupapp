# README
To start the project simply clone the repository and run `docker compose up`
Visit webpage on localhost:3007 to view the app.
If there are any pending migrations you can execute `docker exec -it <container name> bin/rails db:migrate`.
To get appropriate container name view `docker ps` and choose container running rails app.

In case if you want to start development you need to have ruby 3.2.1 pre installed.
In this case you can start only postgresql database in a container by running `docker compose up db`.
Then you can run rails sever localy on host machine.
