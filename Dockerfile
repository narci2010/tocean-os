FROM java:8
EXPOSE 8080 8441

VOLUME /tmp
ADD toceansoft-dev.jar /app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","/app.jar"]
