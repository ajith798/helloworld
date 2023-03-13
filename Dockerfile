FROM tomcat:8
COPY target/app.jar /usr/local/tomcat/webapps/
