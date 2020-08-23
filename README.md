# Run Postman Collections Using Subrat's Docker-docker pull subrat1982/newman-postman:latest

[Postman] is an awesome tool for building and running your Api test checks through the built-in collection runner
which is amazing but what I like to do is publish a nice non technical Report Produced for Project Stakeholders,
once I have created a stable collection for the project, this is export my shared folder along with environment files from the application and run them in the command line using 
flawlessly using [Newman] CLI.

I have [nodejs] and [npm] framework installed on my local machine to perform the task,But now we have a need to configure It on the CI so I have to write a flexible and reusable setup for that.
This is why i think of containerising it, I know Docker so it comes in handy, you probably can use any other container of your choice, It might look bit difficult initially but trust me it is immensely easy believe in 'learning by doing'.
I've a fully public docker hub account where I time and again put valuable stuff for Testing!!      
Do visit https://hub.docker.com/r/subrat1982/newman-postman If you don't need HTML report you can use below command to fetch the container directly from Docker Hub.
```bash
docker pull subrat1982/newman-postman
```
```bash
docker run --rm -v ~/Desktop/Postman:/etc/newman -t subrat1982/newman-postman:latest run "Corporate-Sending-Final-Testcases-DEV.postman_collection.json" -e "Corporate-Sending.postman_environment.json" -n 10        
```
Just put your collection name and env file name , mount your volume to container volume
---

This is an example taken from Dockerhub using the `subrat1982/newman-postman:latest` image:

```bash
docker run --rm -v ~/Desktop/Postman:/etc/newman -t subrat1982/newman-postman:latest run "Corporate-Sending-Final-Testcases-DEV.postman_collection.json" -e "Corporate-Sending.postman_environment.json" -n 10        
```

This command will run your collection and shows the outcome on cli
---

### What Have I Done extra?
I have created a docker file which enables couple of Html libraries on top of vanilla newman
It is currently not possible to extend the html reporting functionality on vanilla docker hence I have implemented Docker Compose 
To solve this I have created  `docker-compose.yml` file to help make solve the problem.

```
version: "2"
services:
  postman_checks:
      container_name: Postman_npm_latest
      build: .
      image: subrat1982/newman-postman:latest
      command:
        run Corporate-Sending-Final-Testcases-DEV.postman_collection.json
        -e  environments/Corporate-Sending.postman_environment.json
        -r  html,htmlextra,cli
        --reporter-htmlextra-title  Api_Tests_Dev
        --reporter-htmlextra-export reports/Api_Tests_Dev.html
        --reporter-html-export reports/Api_Tests_Dev.html
      volumes:
        - ./src:/etc/newman
```
### Time To Run The Collection For HTML Report

To run this collection from the command line, assuming you have Docker running on your flavour of OS, type the following:

```bash
docker-compose.yml build and "then use" docker-compose up
```
### Contact Me for Support if things don't work or you face some Failures
 <Subrat.mishr08@gmail.com>
