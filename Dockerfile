# 1. Base image: Tomcat with JDK‑11
FROM tomcat:9-jdk11

# 2. Remove default webapps for a clean slate
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. Copy your WAR into Tomcat as ROOT.war
COPY target/XYZtechnologies-1.0.war /usr/local/tomcat/webapps/ROOT.war

# 4. Expose Tomcat’s port
EXPOSE 8080

# 5. Start Tomcat
CMD ["catalina.sh", "run"]
