FROM hseeberger/scala-sbt:8u302_1.5.5_2.13.6
WORKDIR /app
COPY ./Bkr.Demo.jar ./
# RUN sbt compile
## Ideally, build the JAR and deploy it to a different runtime image... but just using this one for the moment
ENTRYPOINT ["java", "-jar", "Bkr.Demo.jar"]