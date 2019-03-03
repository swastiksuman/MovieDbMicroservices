# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="swastiksuman@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

#Add Bash
RUN apk update && apk add bash

# Make port 8080 available to the world outside this container
EXPOSE 8761 
EXPOSE 8081
EXPOSE 8082
EXPOSE 8083

# The application's jar file
ARG JAR_FILE1=discovery-server/target/discovery-server-0.0.1-SNAPSHOT.jar
ARG JAR_FILE2=movie-catalog-service/target/movie-catalog-service-0.0.1-SNAPSHOT.jar
ARG JAR_FILE3=movie-info-service/target/movie-info-service-0.0.1-SNAPSHOT.jar
ARG JAR_FILE4=ratings-data-service/target/ratings-data-service-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE1} my-app1.jar
ADD ${JAR_FILE2} my-app2.jar
ADD ${JAR_FILE3} my-app3.jar
ADD ${JAR_FILE4} my-app4.jar
ADD init.sh .

# Run the jar file 
CMD ["bash", "init.sh"]
