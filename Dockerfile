FROM openjdk:8
EXPOSE 8080
ADD ./*.jar helloworld.jar 
ENTRYPOINT ["java","-jar","/helloworld.jar"]
