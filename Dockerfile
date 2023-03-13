FROM tomcat
COPY target/app.jar /usr/local/tomcat/webapps/
