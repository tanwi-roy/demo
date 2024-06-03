# # Start with a base image containing Java runtime
# FROM openjdk:11-jre-slim
#
# # Add a volume pointing to /tmp
# VOLUME /tmp
#
# # Make port 8080 available to the world outside this container
# EXPOSE 8081
#
# # The application's jar file
# ARG JAR_FILE=build/libs/demo.jar
#
# # Add the application's jar to the container
# ADD ${JAR_FILE} app.jar
#
# # Run the jar file
# ENTRYPOINT ["java","-jar","/app.jar"]


#Start with a base image containing Java runtime
FROM openjdk:11-jdk-slim as build

# Add the application's jar to the container
COPY build/libs/demo.jar demo.jar

#execute the application
ENTRYPOINT ["java","-jar","/demo.jar"]