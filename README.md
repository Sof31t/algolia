# Algolia
<a href="http://ruby-doc.org/core-2.3.1/">
  <img src="https://img.shields.io/badge/Ruby-2.3.1-yellow.svg">
</a>
<a href="http://www.rubydoc.info/gems/rails">
  <img src="https://img.shields.io/badge/Rails-5.1.4-yellow.svg">
</a>
<a href="https://hub.docker.com/_/postgres/">
  <img src="https://img.shields.io/badge/Postgres-9.5.2-yellow.svg">
</a>
<a href="https://hub.docker.com/_/ruby/">
  <img src="https://img.shields.io/badge/Docker-ruby:2.3.1 slim-yellow.svg">
</a>
<a href="https://try-algolia.herokuapp.com/">
  <img src="https://img.shields.io/badge/Heroku-Production-blue.svg">
</a>
<br /><br />
Welcome to the Algolia App !

# Requirements
Docker software is needed in order to setup this app, download and install it from [here](https://docs.docker.com/docker-for-mac/)

# Build docker image:
For the first time and after any change occured on the `Dockerfile`, you have to build again !
``` bash
docker-compose build
```
# Secrets
You will need to create a file to keep secrets in the [docker folder](docker/) like following:
``` bash
# docker/secrets.env
ALGOLIA_APPLICATION_ID=KZXM4R3Z2L
ALGOLIA_API_KEY=k27dmtcuvixym29r38nrmv6uv54qrr4x
ALGOLIA_CLIENT_API_KEY=q14f0egdqak490ro0k4f0ijs68aaaua5
```
PS: This is just an example with fake secrets

# Launch docker
Launching docker will automatically launch local server for you
``` bash
docker-compose up
```
If you dont have any interest to visualise real time logs, you can launch it in background
``` bash
docker-compose up -d
```

# Access APP
Your local app will be accessible in the localhost (0.0.0.0) via port 3003
``` bash
http://localhost:3003/
```

# Populate database
To initialise database with a dumped JSON ([data.json](db/data/data.json)), you will need to run a rake task inside your docker container like following:
``` bash
# Go inside container
docker exec -it algolia bash

# Start populating
rake apps:populate
```
![alt text](https://image.ibb.co/ibwPTk/Capture_d_e_cran_2017_09_17_a_17_55_32.png)

# Enjoy searching
![alt text](https://image.ibb.co/gz95ZQ/Capture_d_e_cran_2017_09_22_a_01_47_50.png)
