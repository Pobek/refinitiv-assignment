# Refinitiv Assignment

This repository is for an assigment given by the
`Refinitiv` devops crew.

This repository contains a `python flask` application
and an `nginx` configuration as a load balancer.

## Architecture

![Architecture][architecture]

[architecture]: https://i.imgur.com/2AbHvcy.png "Architecture"

1. A user sends an HTTP request for the exposed address of `nginx`
with the uri `/api/ip` to receive the ip address from one of the
applications.

2. The `nginx` load balancer will forward the request to one of the
application written in the configuration file in a `round-robin`
fashion.

3. When an application receives the request, It will return a json
with the requested data. Exmaple:

    ```json
    {
      "ip-address" : "172.17.0.3"
    }
    ```

## Getting Started

### How to deploy

To deploy the environment, there is a `shell` script in the main
repository directory named `deploy_refinitiv_app.sh`. You need to
run it as root in order to deploy docker containers.

### How to test

To test the environment, there are two options:

1. Use the `test_refinitiv_app.sh` shell script to test the results
returned from the applications.

2. Open up a web browser and go to `http://localhost:8080/`.
This will open the main page of an application with a simple
explanation on how to use it.

### How to use the API

|URI Endpoint|Returned Value|
|---|---|
|/|Will return the main page with URI explanation like this|
|/ip|Will return the host ip address|
|/time|Will return the current date & time|
|/api/ip|Will return the host ip address in JSON format|
|/api/time|Will return the current date & time in JSON format|