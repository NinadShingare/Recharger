FROM tomcat:8.0.51-jre8-alpine
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./target/mobileplan.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh","run"]

FROM openjdk:11
EXPOSE 8080
ADD target/mobileplan.war   mobileplan.war
ENTRYPOINT ["java", "-jar", "mobileplan.war"]