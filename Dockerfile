FROM openjdk:8
COPY target/*.jar /
EXPOSE 8080
ENTRYPOINT ["java","-jar","/devops-integration.jar"]
