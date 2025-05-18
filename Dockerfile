FROM anapsix/alpine-java
LABEL maintainer="Kevin Valencia <kvalencia424@soyudemedellin.edu.co>"
COPY target/spring-petclinic-*.jar /home/spring-petclinic-app.jar
CMD ["java", "-jar", "/home/spring-petclinic-app.jar"]