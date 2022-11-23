# Create image from Image Tomcat
FROM tomcat:9.0-jre11
# ADD service.war /usr/local/tomcat/webapps
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]



